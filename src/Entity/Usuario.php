<?php

namespace App\Entity;

use App\Repository\UsuarioRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\UserInterface;

/**
 * @ORM\Entity(repositoryClass=UsuarioRepository::class)
 */
class Usuario implements UserInterface
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     */
    private $email;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=200)
     */
    private $nombre;

    /**
     * @ORM\Column(type="string", length=200)
     */
    private $apellidos;

    /**
     * @ORM\Column(type="string", length=12)
     */
    private $telefono;

    /**
     * @ORM\Column(type="string", length=200)
     */
    private $foto;

    /**
     * @ORM\OneToMany(targetEntity=Incidencia::class, mappedBy="id_usuario")
     */
    private $id_incidencia;

    public function __construct()
    {
        $this->id_incidencia = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_USER';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see UserInterface
     */
    public function getPassword(): string
    {
        return (string) $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * Returning a salt is only needed, if you are not using a modern
     * hashing algorithm (e.g. bcrypt or sodium) in your security.yaml.
     *
     * @see UserInterface
     */
    public function getSalt(): ?string
    {
        return null;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }

    public function getNombre(): ?string
    {
        return $this->nombre;
    }

    public function setNombre(string $nombre): self
    {
        $this->nombre = $nombre;

        return $this;
    }

    public function getApellidos(): ?string
    {
        return $this->apellidos;
    }

    public function setApellidos(string $apellidos): self
    {
        $this->apellidos = $apellidos;

        return $this;
    }

    public function getTelefono(): ?string
    {
        return $this->telefono;
    }

    public function setTelefono(string $telefono): self
    {
        $this->telefono = $telefono;

        return $this;
    }

    public function getFoto(): ?string
    {
        return $this->foto;
    }

    public function setFoto(string $foto): self
    {
        $this->foto = $foto;

        return $this;
    }

    /**
     * @return Collection|Incidencia[]
     */
    public function getIdIncidencia(): Collection
    {
        return $this->id_incidencia;
    }

    public function addIdIncidencium(Incidencia $idIncidencium): self
    {
        if (!$this->id_incidencia->contains($idIncidencium)) {
            $this->id_incidencia[] = $idIncidencium;
            $idIncidencium->setIdUsuario($this);
        }

        return $this;
    }

    public function removeIdIncidencium(Incidencia $idIncidencium): self
    {
        if ($this->id_incidencia->removeElement($idIncidencium)) {
            // set the owning side to null (unless already changed)
            if ($idIncidencium->getIdUsuario() === $this) {
                $idIncidencium->setIdUsuario(null);
            }
        }

        return $this;
    }
}

namespace Aula_29.Models
{
    public class Filme
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public DateOnly DateTime { get; set; }

        public TimeSpan Duracao { get; set; }
    }
}

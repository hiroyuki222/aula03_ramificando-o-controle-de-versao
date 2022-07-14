using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Aula_29.Models;

namespace Aula_29.Controllers
{
    public class AtorsController : Controller
    {
        private readonly Catalogo _context;

        public AtorsController(Catalogo context)
        {
            _context = context;
        }

        // GET: Ators
        public async Task<IActionResult> Index()
        {
              return _context.Ator != null ? 
                          View(await _context.Ator.ToListAsync()) :
                          Problem("Entity set 'Catalogo.Ator'  is null.");
        }

        // GET: Ators/Details/5
        public async Task<IActionResult> Details(string id)
        {
            if (id == null || _context.Ator == null)
            {
                return NotFound();
            }

            var ator = await _context.Ator
                .FirstOrDefaultAsync(m => m.Id == id);
            if (ator == null)
            {
                return NotFound();
            }

            return View(ator);
        }

        // GET: Ators/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Ators/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Sobrenome")] Ator ator)
        {
            if (ModelState.IsValid)
            {
                _context.Add(ator);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(ator);
        }

        // GET: Ators/Edit/5
        public async Task<IActionResult> Edit(string id)
        {
            if (id == null || _context.Ator == null)
            {
                return NotFound();
            }

            var ator = await _context.Ator.FindAsync(id);
            if (ator == null)
            {
                return NotFound();
            }
            return View(ator);
        }

        // POST: Ators/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(string id, [Bind("Id,Name,Sobrenome")] Ator ator)
        {
            if (id != ator.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(ator);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AtorExists(ator.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(ator);
        }

        // GET: Ators/Delete/5
        public async Task<IActionResult> Delete(string id)
        {
            if (id == null || _context.Ator == null)
            {
                return NotFound();
            }

            var ator = await _context.Ator
                .FirstOrDefaultAsync(m => m.Id == id);
            if (ator == null)
            {
                return NotFound();
            }

            return View(ator);
        }

        // POST: Ators/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(string id)
        {
            if (_context.Ator == null)
            {
                return Problem("Entity set 'Catalogo.Ator'  is null.");
            }
            var ator = await _context.Ator.FindAsync(id);
            if (ator != null)
            {
                _context.Ator.Remove(ator);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AtorExists(string id)
        {
          return (_context.Ator?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}

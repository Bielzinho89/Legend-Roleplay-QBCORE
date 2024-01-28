const { ref, onBeforeUnmount } = Vue

const app = Vue.createApp({
  setup () {
    const progress = ref([
      { loading: false, percentage: 0 },
      { loading: false, percentage: 0 },
      { loading: false, percentage: 0 }
    ])
    
    const intervals = [ null, null, null ]

    function startComputing (id) {
      progress.value[ id ].loading = true
      progress.value[ id ].percentage = 0

      intervals[ id ] = setInterval(() => {
        progress.value[ id ].percentage += Math.floor(Math.random() * 8 + 10)
        if (progress.value[ id ].percentage >= 100) {
          clearInterval(intervals[ id ])
          progress.value[ id ].loading = false
        }
      }, 700)
    }

    onBeforeUnmount(() => {
      intervals.forEach(val => {
        clearInterval(val)
      })
    }) 
    return {
      tab: ref('hud'),
      splitterModel: ref(20),
      selection: ref([]),
      changemap: ref('Circle'),
      changefps: ref('Optimized'),
      progress,
      startComputing,
      outsidemap: ref(true),
      logo: ref(true),
      streets: ref(true),
      compass: ref(true),
      map: ref(true),
      mapBorders: ref(true),
      openMenuSounds: ref(true),
      resetHudSounds: ref(true),
      checklistSounds: ref(true),
      mapNotif: ref(true),
      lowFuel: ref(true),
      cinematicNotif: ref(true),
    }
    
  }
})

app.use(Quasar, { config: {} })
app.mount('#menu')

document.onkeyup = function (data) {
  if (data.key == 'Escape') {
    closeMenu()
  }
};

function closeMenu() {
  $("#openmenu").fadeOut(550);
  $.post('https://bb-menu/closeMenu');
}
function restartHud() {
  $.post('https://bb-hud/restartHud');
}
function showOutMap() {
  $.post('https://bb-hud/showOutMap');
}
function showBrand() {
  $.post('https://lj-brand/showBrand');
}
function openMenuSounds() {
  $.post('https://bb-hud/openMenuSounds');
}
function resetHudSounds() {
  $.post('https://bb-hud/resetHudSounds');
}
function checklistSounds() {
  $.post('https://bb-hud/checklistSounds');
}
function showMapNotif() {
  $.post('https://bb-hud/showMapNotif');
}
function showFuelAlert() {
  $.post('https://bb-hud/showFuelAlert');
}
function showCinematicNotif() {
  $.post('https://bb-hud/showCinematicNotif');
}
function dynamicHealth() {
  $.post('https://bb-hud/dynamicHealth');
}
function dynamicArmor() {
  $.post('https://bb-hud/dynamicArmor');
}
function dynamicHunger() {
  $.post('https://bb-hud/dynamicHunger');
}
function dynamicThirst() {
  $.post('https://bb-hud/dynamicThirst');
}
function dynamicStress() {
  $.post('https://bb-hud/dynamicStress');
}
function dynamicOxygen() {
  $.post('https://bb-hud/dynamicOxygen');
}
function dynamicEngine() {
  $.post('https://bb-hud/dynamicEngine');
}
function dynamicNitro() {
  $.post('https://bb-hud/dynamicNitro');
}
function ToggleMapShape() {
  $.post('https://bb-hud/ToggleMapShape');
}
function changeFPS() {
  $.post('https://bb-hud/changeFPS');
}
function ToggleMapBorders() {
  $.post('https://bb-hud/ToggleMapBorders');
}
function HideMap() {
  $.post('https://bb-hud/HideMap');
}
function HideCompass() {
  $.post('https://bb-compass/HideCompass');
}
function HideStreets() {
  $.post('https://bb-compass/HideStreets');
}
function cinematicMode() {
  $.post('https://bb-hud/cinematicMode');
}
function hideReticle() {
  $.post('https://bb-hud/hideReticle');
}

$(document).ready(function () {
  window.addEventListener("message", function (event) {
    switch (event.data.action) {
    case "open":
      Open(event.data);
      break;
    }
  });
});

Open = function (data) {
  $("#openmenu").fadeIn(150);
}
$('.closeMenu').click(() => {
  closeMenu()
});
$('.OutsideMap').click(() => {
  showOutMap()
});
$('.ShowBrand').click(() => {
  showBrand()
});
$('.ResetHud').click(() => {
  restartHud()
});
$('.MenuSound').click(() => {
  openMenuSounds()
});
$('.ResetSound').click(() => {
  resetHudSounds()
});
$('.CheckListSound').click(() => {
  checklistSounds()
});
$('.MapNotif').click(() => {
  showMapNotif()
});
$('.LowFuel').click(() => {
  showFuelAlert()
});
$('.CinematicNotif').click(() => {
  showCinematicNotif()
});
$('.Health').click(() => {
  dynamicHealth()
});
$('.Armor').click(() => {
  dynamicArmor()
});
$('.Hunger').click(() => {
  dynamicHunger()
});
$('.Thirst').click(() => {
  dynamicThirst()
});
$('.Stress').click(() => {
  dynamicStress()
});
$('.Oxygen').click(() => {
  dynamicOxygen()
});
$('.Engine').click(() => {
  dynamicEngine()
});
$('.Nitro').click(() => {
  dynamicNitro()
});
$('.FpsChange').click(() => {
  changeFPS()
});
$('.MapShape').click(() => {
  ToggleMapShape()
});
$('.MapBorders').click(() => {
  ToggleMapBorders()
});
$('.HideMap').click(() => {
  HideMap()
});
$('.HideCompass').click(() => {
  HideCompass()
});
$('.HideStreets').click(() => {
  HideStreets()
});
$('.Cinematic').click(() => {
  cinematicMode()
});
$('.HideReticle').click(() => {
  hideReticle()
});

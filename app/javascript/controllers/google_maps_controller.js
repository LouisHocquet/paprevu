import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="google-maps"
export default class extends Controller {
  static targets = ["myMap"]

  connect() {
    this.initMap()
  }

  async initMap() {
    const position = { lat: 50.6244315192267, lng: 3.0638992760577226 }

    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

    let map;

    map = new Map(this.myMapTarget, {
      center: position,
      zoom: 16,
      mapId: "DEMO_MAP_ID"
    });

    const marker = new AdvancedMarkerElement({
      map: map,
      position: position,
      title: "Maison !",
      gmpClickable: true,
    });

    marker.addListener("click", ({ domEvent, latLng }) => {
      const { target } = domEvent;
      alert(marker.title);
    });
  }
}

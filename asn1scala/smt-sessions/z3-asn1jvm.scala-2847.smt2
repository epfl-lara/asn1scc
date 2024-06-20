; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68598 () Bool)

(assert start!68598)

(declare-fun mapNonEmpty!2801 () Bool)

(declare-fun mapRes!2802 () Bool)

(declare-fun tp!2802 () Bool)

(declare-fun tp_is_empty!879 () Bool)

(assert (=> mapNonEmpty!2801 (= mapRes!2802 (and tp!2802 tp_is_empty!879))))

(declare-datatypes ((T!58005 0))(
  ( (T!58006 (val!439 Int)) )
))
(declare-fun mapRest!2801 () (Array (_ BitVec 32) T!58005))

(declare-fun mapValue!2801 () T!58005)

(declare-fun mapKey!2802 () (_ BitVec 32))

(declare-datatypes ((array!18743 0))(
  ( (array!18744 (arr!9209 (Array (_ BitVec 32) T!58005)) (size!8126 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18743)

(assert (=> mapNonEmpty!2801 (= (arr!9209 a1!524) (store mapRest!2801 mapKey!2802 mapValue!2801))))

(declare-fun b!308938 () Bool)

(declare-fun res!253433 () Bool)

(declare-fun e!222287 () Bool)

(assert (=> b!308938 (=> (not res!253433) (not e!222287))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(assert (=> b!308938 (= res!253433 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun mapIsEmpty!2801 () Bool)

(declare-fun mapRes!2801 () Bool)

(assert (=> mapIsEmpty!2801 mapRes!2801))

(declare-fun b!308939 () Bool)

(declare-fun e!222288 () Bool)

(assert (=> b!308939 (= e!222288 (and tp_is_empty!879 mapRes!2801))))

(declare-fun condMapEmpty!2802 () Bool)

(declare-fun a2!524 () array!18743)

(declare-fun mapDefault!2802 () T!58005)

(assert (=> b!308939 (= condMapEmpty!2802 (= (arr!9209 a2!524) ((as const (Array (_ BitVec 32) T!58005)) mapDefault!2802)))))

(declare-fun e!222285 () Bool)

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun b!308940 () Bool)

(declare-fun arrayRangesEq!1741 (array!18743 array!18743 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308940 (= e!222285 (arrayRangesEq!1741 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun mapIsEmpty!2802 () Bool)

(assert (=> mapIsEmpty!2802 mapRes!2802))

(declare-fun res!253428 () Bool)

(assert (=> start!68598 (=> (not res!253428) (not e!222287))))

(declare-fun from!650 () (_ BitVec 32))

(assert (=> start!68598 (= res!253428 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8126 a1!524) (size!8126 a2!524)) (bvsle to!617 (size!8126 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68598 e!222287))

(assert (=> start!68598 true))

(declare-fun array_inv!7711 (array!18743) Bool)

(assert (=> start!68598 (and (array_inv!7711 a2!524) e!222288)))

(declare-fun e!222286 () Bool)

(assert (=> start!68598 (and (array_inv!7711 a1!524) e!222286)))

(declare-fun b!308941 () Bool)

(assert (=> b!308941 (= e!222286 (and tp_is_empty!879 mapRes!2802))))

(declare-fun condMapEmpty!2801 () Bool)

(declare-fun mapDefault!2801 () T!58005)

(assert (=> b!308941 (= condMapEmpty!2801 (= (arr!9209 a1!524) ((as const (Array (_ BitVec 32) T!58005)) mapDefault!2801)))))

(declare-fun mapNonEmpty!2802 () Bool)

(declare-fun tp!2801 () Bool)

(assert (=> mapNonEmpty!2802 (= mapRes!2801 (and tp!2801 tp_is_empty!879))))

(declare-fun mapValue!2802 () T!58005)

(declare-fun mapRest!2802 () (Array (_ BitVec 32) T!58005))

(declare-fun mapKey!2801 () (_ BitVec 32))

(assert (=> mapNonEmpty!2802 (= (arr!9209 a2!524) (store mapRest!2802 mapKey!2801 mapValue!2802))))

(declare-fun b!308942 () Bool)

(declare-fun res!253432 () Bool)

(assert (=> b!308942 (=> (not res!253432) (not e!222287))))

(assert (=> b!308942 (= res!253432 (arrayRangesEq!1741 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308943 () Bool)

(declare-fun res!253429 () Bool)

(assert (=> b!308943 (=> (not res!253429) (not e!222287))))

(assert (=> b!308943 (= res!253429 e!222285)))

(declare-fun res!253430 () Bool)

(assert (=> b!308943 (=> res!253430 e!222285)))

(assert (=> b!308943 (= res!253430 (bvsgt i!932 toSlice!46))))

(declare-fun b!308944 () Bool)

(assert (=> b!308944 (= e!222287 (and (not (= i!932 fromSlice!46)) (not (= (bvand i!932 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!932 #b10000000000000000000000000000000) (bvand (bvsub i!932 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!308945 () Bool)

(declare-fun res!253431 () Bool)

(assert (=> b!308945 (=> (not res!253431) (not e!222287))))

(assert (=> b!308945 (= res!253431 (arrayRangesEq!1741 a1!524 a2!524 from!650 to!617))))

(assert (= (and start!68598 res!253428) b!308945))

(assert (= (and b!308945 res!253431) b!308938))

(assert (= (and b!308938 res!253433) b!308942))

(assert (= (and b!308942 res!253432) b!308943))

(assert (= (and b!308943 (not res!253430)) b!308940))

(assert (= (and b!308943 res!253429) b!308944))

(assert (= (and b!308939 condMapEmpty!2802) mapIsEmpty!2801))

(assert (= (and b!308939 (not condMapEmpty!2802)) mapNonEmpty!2802))

(assert (= start!68598 b!308939))

(assert (= (and b!308941 condMapEmpty!2801) mapIsEmpty!2802))

(assert (= (and b!308941 (not condMapEmpty!2801)) mapNonEmpty!2801))

(assert (= start!68598 b!308941))

(declare-fun m!447077 () Bool)

(assert (=> mapNonEmpty!2801 m!447077))

(declare-fun m!447079 () Bool)

(assert (=> mapNonEmpty!2802 m!447079))

(declare-fun m!447081 () Bool)

(assert (=> start!68598 m!447081))

(declare-fun m!447083 () Bool)

(assert (=> start!68598 m!447083))

(declare-fun m!447085 () Bool)

(assert (=> b!308945 m!447085))

(declare-fun m!447087 () Bool)

(assert (=> b!308940 m!447087))

(declare-fun m!447089 () Bool)

(assert (=> b!308942 m!447089))

(check-sat (not mapNonEmpty!2802) (not b!308942) tp_is_empty!879 (not start!68598) (not b!308940) (not mapNonEmpty!2801) (not b!308945))
(check-sat)

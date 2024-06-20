; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68610 () Bool)

(assert start!68610)

(declare-fun b!309087 () Bool)

(declare-fun e!222359 () Bool)

(declare-fun tp_is_empty!891 () Bool)

(declare-fun mapRes!2837 () Bool)

(assert (=> b!309087 (= e!222359 (and tp_is_empty!891 mapRes!2837))))

(declare-fun condMapEmpty!2837 () Bool)

(declare-datatypes ((T!58057 0))(
  ( (T!58058 (val!445 Int)) )
))
(declare-datatypes ((array!18755 0))(
  ( (array!18756 (arr!9215 (Array (_ BitVec 32) T!58057)) (size!8132 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18755)

(declare-fun mapDefault!2837 () T!58057)

(assert (=> b!309087 (= condMapEmpty!2837 (= (arr!9215 a1!524) ((as const (Array (_ BitVec 32) T!58057)) mapDefault!2837)))))

(declare-fun mapIsEmpty!2837 () Bool)

(declare-fun mapRes!2838 () Bool)

(assert (=> mapIsEmpty!2837 mapRes!2838))

(declare-fun b!309088 () Bool)

(declare-fun res!253541 () Bool)

(declare-fun e!222358 () Bool)

(assert (=> b!309088 (=> (not res!253541) (not e!222358))))

(declare-fun e!222357 () Bool)

(assert (=> b!309088 (= res!253541 e!222357)))

(declare-fun res!253543 () Bool)

(assert (=> b!309088 (=> res!253543 e!222357)))

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(assert (=> b!309088 (= res!253543 (bvsgt i!932 toSlice!46))))

(declare-fun mapIsEmpty!2838 () Bool)

(assert (=> mapIsEmpty!2838 mapRes!2837))

(declare-fun b!309089 () Bool)

(declare-fun res!253547 () Bool)

(assert (=> b!309089 (=> (not res!253547) (not e!222358))))

(declare-fun a2!524 () array!18755)

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun arrayRangesEq!1745 (array!18755 array!18755 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309089 (= res!253547 (arrayRangesEq!1745 a1!524 a2!524 from!650 to!617))))

(declare-fun mapNonEmpty!2837 () Bool)

(declare-fun tp!2837 () Bool)

(assert (=> mapNonEmpty!2837 (= mapRes!2837 (and tp!2837 tp_is_empty!891))))

(declare-fun mapValue!2837 () T!58057)

(declare-fun mapKey!2838 () (_ BitVec 32))

(declare-fun mapRest!2837 () (Array (_ BitVec 32) T!58057))

(assert (=> mapNonEmpty!2837 (= (arr!9215 a1!524) (store mapRest!2837 mapKey!2838 mapValue!2837))))

(declare-fun b!309090 () Bool)

(declare-fun res!253546 () Bool)

(assert (=> b!309090 (=> (not res!253546) (not e!222358))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> b!309090 (= res!253546 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(declare-fun res!253545 () Bool)

(assert (=> start!68610 (=> (not res!253545) (not e!222358))))

(assert (=> start!68610 (= res!253545 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8132 a1!524) (size!8132 a2!524)) (bvsle to!617 (size!8132 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68610 e!222358))

(assert (=> start!68610 true))

(declare-fun e!222360 () Bool)

(declare-fun array_inv!7716 (array!18755) Bool)

(assert (=> start!68610 (and (array_inv!7716 a2!524) e!222360)))

(assert (=> start!68610 (and (array_inv!7716 a1!524) e!222359)))

(declare-fun b!309091 () Bool)

(assert (=> b!309091 (= e!222357 (arrayRangesEq!1745 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun b!309092 () Bool)

(declare-fun res!253542 () Bool)

(assert (=> b!309092 (=> (not res!253542) (not e!222358))))

(assert (=> b!309092 (= res!253542 (not (= i!932 fromSlice!46)))))

(declare-fun b!309093 () Bool)

(assert (=> b!309093 (= e!222360 (and tp_is_empty!891 mapRes!2838))))

(declare-fun condMapEmpty!2838 () Bool)

(declare-fun mapDefault!2838 () T!58057)

(assert (=> b!309093 (= condMapEmpty!2838 (= (arr!9215 a2!524) ((as const (Array (_ BitVec 32) T!58057)) mapDefault!2838)))))

(declare-fun b!309094 () Bool)

(assert (=> b!309094 (= e!222358 (not (or (= (bvand i!932 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand i!932 #b10000000000000000000000000000000) (bvand (bvsub i!932 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(assert (=> b!309094 (= (select (arr!9215 a1!524) (bvsub i!932 #b00000000000000000000000000000001)) (select (arr!9215 a2!524) (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-datatypes ((Unit!21475 0))(
  ( (Unit!21476) )
))
(declare-fun lt!440355 () Unit!21475)

(declare-fun arrayRangesEqImpliesEq!308 (array!18755 array!18755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21475)

(assert (=> b!309094 (= lt!440355 (arrayRangesEqImpliesEq!308 a1!524 a2!524 from!650 (bvsub i!932 #b00000000000000000000000000000001) to!617))))

(declare-fun b!309095 () Bool)

(declare-fun res!253544 () Bool)

(assert (=> b!309095 (=> (not res!253544) (not e!222358))))

(assert (=> b!309095 (= res!253544 (arrayRangesEq!1745 a1!524 a2!524 i!932 to!617))))

(declare-fun mapNonEmpty!2838 () Bool)

(declare-fun tp!2838 () Bool)

(assert (=> mapNonEmpty!2838 (= mapRes!2838 (and tp!2838 tp_is_empty!891))))

(declare-fun mapRest!2838 () (Array (_ BitVec 32) T!58057))

(declare-fun mapValue!2838 () T!58057)

(declare-fun mapKey!2837 () (_ BitVec 32))

(assert (=> mapNonEmpty!2838 (= (arr!9215 a2!524) (store mapRest!2838 mapKey!2837 mapValue!2838))))

(assert (= (and start!68610 res!253545) b!309089))

(assert (= (and b!309089 res!253547) b!309090))

(assert (= (and b!309090 res!253546) b!309095))

(assert (= (and b!309095 res!253544) b!309088))

(assert (= (and b!309088 (not res!253543)) b!309091))

(assert (= (and b!309088 res!253541) b!309092))

(assert (= (and b!309092 res!253542) b!309094))

(assert (= (and b!309093 condMapEmpty!2838) mapIsEmpty!2837))

(assert (= (and b!309093 (not condMapEmpty!2838)) mapNonEmpty!2838))

(assert (= start!68610 b!309093))

(assert (= (and b!309087 condMapEmpty!2837) mapIsEmpty!2838))

(assert (= (and b!309087 (not condMapEmpty!2837)) mapNonEmpty!2837))

(assert (= start!68610 b!309087))

(declare-fun m!447167 () Bool)

(assert (=> b!309094 m!447167))

(declare-fun m!447169 () Bool)

(assert (=> b!309094 m!447169))

(declare-fun m!447171 () Bool)

(assert (=> b!309094 m!447171))

(declare-fun m!447173 () Bool)

(assert (=> mapNonEmpty!2838 m!447173))

(declare-fun m!447175 () Bool)

(assert (=> mapNonEmpty!2837 m!447175))

(declare-fun m!447177 () Bool)

(assert (=> b!309089 m!447177))

(declare-fun m!447179 () Bool)

(assert (=> start!68610 m!447179))

(declare-fun m!447181 () Bool)

(assert (=> start!68610 m!447181))

(declare-fun m!447183 () Bool)

(assert (=> b!309095 m!447183))

(declare-fun m!447185 () Bool)

(assert (=> b!309091 m!447185))

(check-sat (not b!309089) (not b!309094) (not b!309091) tp_is_empty!891 (not mapNonEmpty!2838) (not mapNonEmpty!2837) (not start!68610) (not b!309095))
(check-sat)

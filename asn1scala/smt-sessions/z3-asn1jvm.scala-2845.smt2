; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68586 () Bool)

(assert start!68586)

(declare-fun mapNonEmpty!2765 () Bool)

(declare-fun mapRes!2766 () Bool)

(declare-fun tp!2765 () Bool)

(declare-fun tp_is_empty!867 () Bool)

(assert (=> mapNonEmpty!2765 (= mapRes!2766 (and tp!2765 tp_is_empty!867))))

(declare-datatypes ((T!57953 0))(
  ( (T!57954 (val!433 Int)) )
))
(declare-fun mapValue!2765 () T!57953)

(declare-fun mapKey!2766 () (_ BitVec 32))

(declare-fun mapRest!2766 () (Array (_ BitVec 32) T!57953))

(declare-datatypes ((array!18731 0))(
  ( (array!18732 (arr!9203 (Array (_ BitVec 32) T!57953)) (size!8120 (_ BitVec 32))) )
))
(declare-fun a1!524 () array!18731)

(assert (=> mapNonEmpty!2765 (= (arr!9203 a1!524) (store mapRest!2766 mapKey!2766 mapValue!2765))))

(declare-fun a2!524 () array!18731)

(declare-fun e!222215 () Bool)

(declare-fun i!932 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-fun b!308785 () Bool)

(declare-fun arrayRangesEq!1735 (array!18731 array!18731 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308785 (= e!222215 (arrayRangesEq!1735 a1!524 a2!524 i!932 toSlice!46))))

(declare-fun mapIsEmpty!2765 () Bool)

(declare-fun mapRes!2765 () Bool)

(assert (=> mapIsEmpty!2765 mapRes!2765))

(declare-fun b!308786 () Bool)

(declare-fun res!253313 () Bool)

(declare-fun e!222214 () Bool)

(assert (=> b!308786 (=> (not res!253313) (not e!222214))))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(assert (=> b!308786 (= res!253313 (arrayRangesEq!1735 a1!524 a2!524 from!650 to!617))))

(declare-fun b!308787 () Bool)

(declare-fun res!253315 () Bool)

(assert (=> b!308787 (=> (not res!253315) (not e!222214))))

(assert (=> b!308787 (= res!253315 (arrayRangesEq!1735 a1!524 a2!524 i!932 to!617))))

(declare-fun b!308788 () Bool)

(declare-fun e!222213 () Bool)

(assert (=> b!308788 (= e!222213 (and tp_is_empty!867 mapRes!2765))))

(declare-fun condMapEmpty!2765 () Bool)

(declare-fun mapDefault!2766 () T!57953)

(assert (=> b!308788 (= condMapEmpty!2765 (= (arr!9203 a2!524) ((as const (Array (_ BitVec 32) T!57953)) mapDefault!2766)))))

(declare-fun b!308789 () Bool)

(declare-fun res!253312 () Bool)

(assert (=> b!308789 (=> (not res!253312) (not e!222214))))

(assert (=> b!308789 (= res!253312 e!222215)))

(declare-fun res!253314 () Bool)

(assert (=> b!308789 (=> res!253314 e!222215)))

(assert (=> b!308789 (= res!253314 (bvsgt i!932 toSlice!46))))

(declare-fun b!308790 () Bool)

(assert (=> b!308790 (= e!222214 (bvslt i!932 #b00000000000000000000000000000000))))

(declare-fun b!308791 () Bool)

(declare-fun e!222216 () Bool)

(assert (=> b!308791 (= e!222216 (and tp_is_empty!867 mapRes!2766))))

(declare-fun condMapEmpty!2766 () Bool)

(declare-fun mapDefault!2765 () T!57953)

(assert (=> b!308791 (= condMapEmpty!2766 (= (arr!9203 a1!524) ((as const (Array (_ BitVec 32) T!57953)) mapDefault!2765)))))

(declare-fun res!253311 () Bool)

(assert (=> start!68586 (=> (not res!253311) (not e!222214))))

(declare-fun fromSlice!46 () (_ BitVec 32))

(assert (=> start!68586 (= res!253311 (and (bvsle #b00000000000000000000000000000000 from!650) (bvsle from!650 to!617) (bvsle (size!8120 a1!524) (size!8120 a2!524)) (bvsle to!617 (size!8120 a1!524)) (bvsle from!650 fromSlice!46) (bvsle fromSlice!46 toSlice!46) (bvsle toSlice!46 to!617)))))

(assert (=> start!68586 e!222214))

(assert (=> start!68586 true))

(declare-fun array_inv!7708 (array!18731) Bool)

(assert (=> start!68586 (and (array_inv!7708 a2!524) e!222213)))

(assert (=> start!68586 (and (array_inv!7708 a1!524) e!222216)))

(declare-fun mapNonEmpty!2766 () Bool)

(declare-fun tp!2766 () Bool)

(assert (=> mapNonEmpty!2766 (= mapRes!2765 (and tp!2766 tp_is_empty!867))))

(declare-fun mapValue!2766 () T!57953)

(declare-fun mapRest!2765 () (Array (_ BitVec 32) T!57953))

(declare-fun mapKey!2765 () (_ BitVec 32))

(assert (=> mapNonEmpty!2766 (= (arr!9203 a2!524) (store mapRest!2765 mapKey!2765 mapValue!2766))))

(declare-fun mapIsEmpty!2766 () Bool)

(assert (=> mapIsEmpty!2766 mapRes!2766))

(declare-fun b!308792 () Bool)

(declare-fun res!253316 () Bool)

(assert (=> b!308792 (=> (not res!253316) (not e!222214))))

(assert (=> b!308792 (= res!253316 (and (bvsle fromSlice!46 i!932) (bvsle i!932 to!617)))))

(assert (= (and start!68586 res!253311) b!308786))

(assert (= (and b!308786 res!253313) b!308792))

(assert (= (and b!308792 res!253316) b!308787))

(assert (= (and b!308787 res!253315) b!308789))

(assert (= (and b!308789 (not res!253314)) b!308785))

(assert (= (and b!308789 res!253312) b!308790))

(assert (= (and b!308788 condMapEmpty!2765) mapIsEmpty!2765))

(assert (= (and b!308788 (not condMapEmpty!2765)) mapNonEmpty!2766))

(assert (= start!68586 b!308788))

(assert (= (and b!308791 condMapEmpty!2766) mapIsEmpty!2766))

(assert (= (and b!308791 (not condMapEmpty!2766)) mapNonEmpty!2765))

(assert (= start!68586 b!308791))

(declare-fun m!446987 () Bool)

(assert (=> b!308787 m!446987))

(declare-fun m!446989 () Bool)

(assert (=> mapNonEmpty!2766 m!446989))

(declare-fun m!446991 () Bool)

(assert (=> mapNonEmpty!2765 m!446991))

(declare-fun m!446993 () Bool)

(assert (=> start!68586 m!446993))

(declare-fun m!446995 () Bool)

(assert (=> start!68586 m!446995))

(declare-fun m!446997 () Bool)

(assert (=> b!308786 m!446997))

(declare-fun m!446999 () Bool)

(assert (=> b!308785 m!446999))

(check-sat (not b!308786) (not mapNonEmpty!2765) (not mapNonEmpty!2766) (not start!68586) tp_is_empty!867 (not b!308787) (not b!308785))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63198 () Bool)

(assert start!63198)

(declare-fun mapNonEmpty!900 () Bool)

(declare-fun mapRes!901 () Bool)

(declare-fun tp!900 () Bool)

(declare-fun tp_is_empty!351 () Bool)

(assert (=> mapNonEmpty!900 (= mapRes!901 (and tp!900 tp_is_empty!351))))

(declare-datatypes ((T!50337 0))(
  ( (T!50338 (val!175 Int)) )
))
(declare-fun mapRest!900 () (Array (_ BitVec 32) T!50337))

(declare-fun mapValue!901 () T!50337)

(declare-datatypes ((array!16386 0))(
  ( (array!16387 (arr!8072 (Array (_ BitVec 32) T!50337)) (size!7076 (_ BitVec 32))) )
))
(declare-fun a2!471 () array!16386)

(declare-fun mapKey!901 () (_ BitVec 32))

(assert (=> mapNonEmpty!900 (= (arr!8072 a2!471) (store mapRest!900 mapKey!901 mapValue!901))))

(declare-fun b!283071 () Bool)

(declare-fun res!234706 () Bool)

(declare-fun e!202174 () Bool)

(assert (=> b!283071 (=> (not res!234706) (not e!202174))))

(declare-fun a1!471 () array!16386)

(declare-fun to!564 () (_ BitVec 32))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun arrayRangesEq!1331 (array!16386 array!16386 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283071 (= res!234706 (arrayRangesEq!1331 a2!471 a1!471 i!913 to!564))))

(declare-fun b!283072 () Bool)

(declare-fun e!202175 () Bool)

(assert (=> b!283072 (= e!202175 (and tp_is_empty!351 mapRes!901))))

(declare-fun condMapEmpty!901 () Bool)

(declare-fun mapDefault!900 () T!50337)

(assert (=> b!283072 (= condMapEmpty!901 (= (arr!8072 a2!471) ((as const (Array (_ BitVec 32) T!50337)) mapDefault!900)))))

(declare-fun b!283073 () Bool)

(declare-fun res!234704 () Bool)

(assert (=> b!283073 (=> (not res!234704) (not e!202174))))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!283073 (= res!234704 (arrayRangesEq!1331 a1!471 a2!471 from!597 to!564))))

(declare-fun b!283074 () Bool)

(declare-fun res!234703 () Bool)

(assert (=> b!283074 (=> (not res!234703) (not e!202174))))

(assert (=> b!283074 (= res!234703 (not (= i!913 from!597)))))

(declare-fun b!283075 () Bool)

(declare-fun res!234702 () Bool)

(assert (=> b!283075 (=> (not res!234702) (not e!202174))))

(assert (=> b!283075 (= res!234702 (and (bvsle from!597 i!913) (bvsle i!913 to!564)))))

(declare-fun res!234705 () Bool)

(assert (=> start!63198 (=> (not res!234705) (not e!202174))))

(assert (=> start!63198 (= res!234705 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7076 a1!471)) (= (size!7076 a1!471) (size!7076 a2!471))))))

(assert (=> start!63198 e!202174))

(declare-fun e!202173 () Bool)

(declare-fun array_inv!6780 (array!16386) Bool)

(assert (=> start!63198 (and (array_inv!6780 a1!471) e!202173)))

(assert (=> start!63198 true))

(assert (=> start!63198 (and (array_inv!6780 a2!471) e!202175)))

(declare-fun b!283076 () Bool)

(declare-fun mapRes!900 () Bool)

(assert (=> b!283076 (= e!202173 (and tp_is_empty!351 mapRes!900))))

(declare-fun condMapEmpty!900 () Bool)

(declare-fun mapDefault!901 () T!50337)

(assert (=> b!283076 (= condMapEmpty!900 (= (arr!8072 a1!471) ((as const (Array (_ BitVec 32) T!50337)) mapDefault!901)))))

(declare-fun mapNonEmpty!901 () Bool)

(declare-fun tp!901 () Bool)

(assert (=> mapNonEmpty!901 (= mapRes!900 (and tp!901 tp_is_empty!351))))

(declare-fun mapRest!901 () (Array (_ BitVec 32) T!50337))

(declare-fun mapKey!900 () (_ BitVec 32))

(declare-fun mapValue!900 () T!50337)

(assert (=> mapNonEmpty!901 (= (arr!8072 a1!471) (store mapRest!901 mapKey!900 mapValue!900))))

(declare-fun mapIsEmpty!900 () Bool)

(assert (=> mapIsEmpty!900 mapRes!901))

(declare-fun b!283077 () Bool)

(assert (=> b!283077 (= e!202174 (not (or (bvsgt (size!7076 a2!471) (size!7076 a1!471)) (bvsle to!564 (size!7076 a2!471)))))))

(declare-datatypes ((Unit!19832 0))(
  ( (Unit!19833) )
))
(declare-fun lt!417890 () Unit!19832)

(declare-fun rec!55 (array!16386 array!16386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19832)

(assert (=> b!283077 (= lt!417890 (rec!55 a1!471 a2!471 from!597 to!564 (bvsub i!913 #b00000000000000000000000000000001)))))

(assert (=> b!283077 (= (select (arr!8072 a1!471) (bvsub i!913 #b00000000000000000000000000000001)) (select (arr!8072 a2!471) (bvsub i!913 #b00000000000000000000000000000001)))))

(declare-fun lt!417891 () Unit!19832)

(declare-fun arrayRangesEqImpliesEq!191 (array!16386 array!16386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19832)

(assert (=> b!283077 (= lt!417891 (arrayRangesEqImpliesEq!191 a1!471 a2!471 from!597 (bvsub i!913 #b00000000000000000000000000000001) to!564))))

(declare-fun mapIsEmpty!901 () Bool)

(assert (=> mapIsEmpty!901 mapRes!900))

(assert (= (and start!63198 res!234705) b!283073))

(assert (= (and b!283073 res!234704) b!283075))

(assert (= (and b!283075 res!234702) b!283071))

(assert (= (and b!283071 res!234706) b!283074))

(assert (= (and b!283074 res!234703) b!283077))

(assert (= (and b!283076 condMapEmpty!900) mapIsEmpty!901))

(assert (= (and b!283076 (not condMapEmpty!900)) mapNonEmpty!901))

(assert (= start!63198 b!283076))

(assert (= (and b!283072 condMapEmpty!901) mapIsEmpty!900))

(assert (= (and b!283072 (not condMapEmpty!901)) mapNonEmpty!900))

(assert (= start!63198 b!283072))

(declare-fun m!416161 () Bool)

(assert (=> start!63198 m!416161))

(declare-fun m!416163 () Bool)

(assert (=> start!63198 m!416163))

(declare-fun m!416165 () Bool)

(assert (=> b!283071 m!416165))

(declare-fun m!416167 () Bool)

(assert (=> b!283073 m!416167))

(declare-fun m!416169 () Bool)

(assert (=> mapNonEmpty!900 m!416169))

(declare-fun m!416171 () Bool)

(assert (=> b!283077 m!416171))

(declare-fun m!416173 () Bool)

(assert (=> b!283077 m!416173))

(declare-fun m!416175 () Bool)

(assert (=> b!283077 m!416175))

(declare-fun m!416177 () Bool)

(assert (=> b!283077 m!416177))

(declare-fun m!416179 () Bool)

(assert (=> mapNonEmpty!901 m!416179))

(check-sat (not b!283073) (not mapNonEmpty!901) (not b!283077) tp_is_empty!351 (not b!283071) (not start!63198) (not mapNonEmpty!900))
(check-sat)

; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63210 () Bool)

(assert start!63210)

(declare-fun mapIsEmpty!936 () Bool)

(declare-fun mapRes!936 () Bool)

(assert (=> mapIsEmpty!936 mapRes!936))

(declare-fun b!283188 () Bool)

(declare-fun res!234784 () Bool)

(declare-fun e!202227 () Bool)

(assert (=> b!283188 (=> (not res!234784) (not e!202227))))

(declare-fun i!913 () (_ BitVec 32))

(declare-fun from!597 () (_ BitVec 32))

(assert (=> b!283188 (= res!234784 (= i!913 from!597))))

(declare-fun mapNonEmpty!936 () Bool)

(declare-fun mapRes!937 () Bool)

(declare-fun tp!936 () Bool)

(declare-fun tp_is_empty!363 () Bool)

(assert (=> mapNonEmpty!936 (= mapRes!937 (and tp!936 tp_is_empty!363))))

(declare-datatypes ((T!50389 0))(
  ( (T!50390 (val!181 Int)) )
))
(declare-fun mapValue!936 () T!50389)

(declare-fun mapKey!936 () (_ BitVec 32))

(declare-fun mapRest!936 () (Array (_ BitVec 32) T!50389))

(declare-datatypes ((array!16398 0))(
  ( (array!16399 (arr!8078 (Array (_ BitVec 32) T!50389)) (size!7082 (_ BitVec 32))) )
))
(declare-fun a1!471 () array!16398)

(assert (=> mapNonEmpty!936 (= (arr!8078 a1!471) (store mapRest!936 mapKey!936 mapValue!936))))

(declare-fun b!283189 () Bool)

(declare-fun e!202228 () Bool)

(assert (=> b!283189 (= e!202228 (and tp_is_empty!363 mapRes!937))))

(declare-fun condMapEmpty!937 () Bool)

(declare-fun mapDefault!937 () T!50389)

(assert (=> b!283189 (= condMapEmpty!937 (= (arr!8078 a1!471) ((as const (Array (_ BitVec 32) T!50389)) mapDefault!937)))))

(declare-fun b!283190 () Bool)

(declare-fun res!234787 () Bool)

(assert (=> b!283190 (=> (not res!234787) (not e!202227))))

(declare-fun to!564 () (_ BitVec 32))

(declare-fun a2!471 () array!16398)

(declare-fun arrayRangesEq!1334 (array!16398 array!16398 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283190 (= res!234787 (arrayRangesEq!1334 a2!471 a1!471 i!913 to!564))))

(declare-fun res!234785 () Bool)

(assert (=> start!63210 (=> (not res!234785) (not e!202227))))

(assert (=> start!63210 (= res!234785 (and (bvsle #b00000000000000000000000000000000 from!597) (bvsle from!597 to!564) (bvsle to!564 (size!7082 a1!471)) (= (size!7082 a1!471) (size!7082 a2!471))))))

(assert (=> start!63210 e!202227))

(declare-fun array_inv!6783 (array!16398) Bool)

(assert (=> start!63210 (and (array_inv!6783 a1!471) e!202228)))

(assert (=> start!63210 true))

(declare-fun e!202229 () Bool)

(assert (=> start!63210 (and (array_inv!6783 a2!471) e!202229)))

(declare-fun b!283191 () Bool)

(declare-fun res!234786 () Bool)

(assert (=> b!283191 (=> (not res!234786) (not e!202227))))

(assert (=> b!283191 (= res!234786 (arrayRangesEq!1334 a1!471 a2!471 from!597 to!564))))

(declare-fun b!283192 () Bool)

(assert (=> b!283192 (= e!202229 (and tp_is_empty!363 mapRes!936))))

(declare-fun condMapEmpty!936 () Bool)

(declare-fun mapDefault!936 () T!50389)

(assert (=> b!283192 (= condMapEmpty!936 (= (arr!8078 a2!471) ((as const (Array (_ BitVec 32) T!50389)) mapDefault!936)))))

(declare-fun b!283193 () Bool)

(assert (=> b!283193 (= e!202227 (not (arrayRangesEq!1334 a2!471 a1!471 from!597 to!564)))))

(declare-fun mapNonEmpty!937 () Bool)

(declare-fun tp!937 () Bool)

(assert (=> mapNonEmpty!937 (= mapRes!936 (and tp!937 tp_is_empty!363))))

(declare-fun mapKey!937 () (_ BitVec 32))

(declare-fun mapRest!937 () (Array (_ BitVec 32) T!50389))

(declare-fun mapValue!937 () T!50389)

(assert (=> mapNonEmpty!937 (= (arr!8078 a2!471) (store mapRest!937 mapKey!937 mapValue!937))))

(declare-fun mapIsEmpty!937 () Bool)

(assert (=> mapIsEmpty!937 mapRes!937))

(declare-fun b!283194 () Bool)

(declare-fun res!234783 () Bool)

(assert (=> b!283194 (=> (not res!234783) (not e!202227))))

(assert (=> b!283194 (= res!234783 (bvsle i!913 to!564))))

(assert (= (and start!63210 res!234785) b!283191))

(assert (= (and b!283191 res!234786) b!283194))

(assert (= (and b!283194 res!234783) b!283190))

(assert (= (and b!283190 res!234787) b!283188))

(assert (= (and b!283188 res!234784) b!283193))

(assert (= (and b!283189 condMapEmpty!937) mapIsEmpty!937))

(assert (= (and b!283189 (not condMapEmpty!937)) mapNonEmpty!936))

(assert (= start!63210 b!283189))

(assert (= (and b!283192 condMapEmpty!936) mapIsEmpty!936))

(assert (= (and b!283192 (not condMapEmpty!936)) mapNonEmpty!937))

(assert (= start!63210 b!283192))

(declare-fun m!416251 () Bool)

(assert (=> b!283193 m!416251))

(declare-fun m!416253 () Bool)

(assert (=> b!283191 m!416253))

(declare-fun m!416255 () Bool)

(assert (=> start!63210 m!416255))

(declare-fun m!416257 () Bool)

(assert (=> start!63210 m!416257))

(declare-fun m!416259 () Bool)

(assert (=> mapNonEmpty!936 m!416259))

(declare-fun m!416261 () Bool)

(assert (=> b!283190 m!416261))

(declare-fun m!416263 () Bool)

(assert (=> mapNonEmpty!937 m!416263))

(check-sat (not b!283193) (not start!63210) (not mapNonEmpty!936) (not b!283191) (not mapNonEmpty!937) (not b!283190) tp_is_empty!363)
(check-sat)

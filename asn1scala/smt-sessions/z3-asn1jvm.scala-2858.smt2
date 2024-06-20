; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68676 () Bool)

(assert start!68676)

(declare-fun mapIsEmpty!3007 () Bool)

(declare-fun mapRes!3008 () Bool)

(assert (=> mapIsEmpty!3007 mapRes!3008))

(declare-fun b!309794 () Bool)

(declare-fun res!254083 () Bool)

(declare-fun e!222731 () Bool)

(assert (=> b!309794 (=> (not res!254083) (not e!222731))))

(declare-fun to!659 () (_ BitVec 32))

(declare-datatypes ((T!58291 0))(
  ( (T!58292 (val!472 Int)) )
))
(declare-datatypes ((array!18811 0))(
  ( (array!18812 (arr!9242 (Array (_ BitVec 32) T!58291)) (size!8159 (_ BitVec 32))) )
))
(declare-fun a2!566 () array!18811)

(declare-fun a1!566 () array!18811)

(declare-fun from!692 () (_ BitVec 32))

(declare-fun arrayRangesEq!1765 (array!18811 array!18811 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!309794 (= res!254083 (arrayRangesEq!1765 a1!566 a2!566 from!692 to!659))))

(declare-fun mapIsEmpty!3008 () Bool)

(declare-fun mapRes!3007 () Bool)

(assert (=> mapIsEmpty!3008 mapRes!3007))

(declare-fun i!943 () (_ BitVec 32))

(declare-fun at!235 () (_ BitVec 32))

(declare-fun b!309795 () Bool)

(assert (=> b!309795 (= e!222731 (and (bvsle from!692 i!943) (bvsle i!943 at!235) (or (bvsgt #b00000000000000000000000000000000 i!943) (bvsgt i!943 to!659))))))

(declare-fun b!309796 () Bool)

(declare-fun e!222729 () Bool)

(declare-fun tp_is_empty!945 () Bool)

(assert (=> b!309796 (= e!222729 (and tp_is_empty!945 mapRes!3008))))

(declare-fun condMapEmpty!3008 () Bool)

(declare-fun mapDefault!3008 () T!58291)

(assert (=> b!309796 (= condMapEmpty!3008 (= (arr!9242 a1!566) ((as const (Array (_ BitVec 32) T!58291)) mapDefault!3008)))))

(declare-fun b!309797 () Bool)

(declare-fun e!222730 () Bool)

(assert (=> b!309797 (= e!222730 (and tp_is_empty!945 mapRes!3007))))

(declare-fun condMapEmpty!3007 () Bool)

(declare-fun mapDefault!3007 () T!58291)

(assert (=> b!309797 (= condMapEmpty!3007 (= (arr!9242 a2!566) ((as const (Array (_ BitVec 32) T!58291)) mapDefault!3007)))))

(declare-fun mapNonEmpty!3008 () Bool)

(declare-fun tp!3007 () Bool)

(assert (=> mapNonEmpty!3008 (= mapRes!3008 (and tp!3007 tp_is_empty!945))))

(declare-fun mapKey!3007 () (_ BitVec 32))

(declare-fun mapRest!3008 () (Array (_ BitVec 32) T!58291))

(declare-fun mapValue!3007 () T!58291)

(assert (=> mapNonEmpty!3008 (= (arr!9242 a1!566) (store mapRest!3008 mapKey!3007 mapValue!3007))))

(declare-fun mapNonEmpty!3007 () Bool)

(declare-fun tp!3008 () Bool)

(assert (=> mapNonEmpty!3007 (= mapRes!3007 (and tp!3008 tp_is_empty!945))))

(declare-fun mapRest!3007 () (Array (_ BitVec 32) T!58291))

(declare-fun mapKey!3008 () (_ BitVec 32))

(declare-fun mapValue!3008 () T!58291)

(assert (=> mapNonEmpty!3007 (= (arr!9242 a2!566) (store mapRest!3007 mapKey!3008 mapValue!3008))))

(declare-fun res!254082 () Bool)

(assert (=> start!68676 (=> (not res!254082) (not e!222731))))

(assert (=> start!68676 (= res!254082 (and (bvsle #b00000000000000000000000000000000 from!692) (bvsle from!692 to!659) (bvsle (size!8159 a1!566) (size!8159 a2!566)) (bvsle to!659 (size!8159 a1!566)) (bvsle from!692 at!235) (bvslt at!235 to!659)))))

(assert (=> start!68676 e!222731))

(assert (=> start!68676 true))

(declare-fun array_inv!7731 (array!18811) Bool)

(assert (=> start!68676 (and (array_inv!7731 a2!566) e!222730)))

(assert (=> start!68676 (and (array_inv!7731 a1!566) e!222729)))

(assert (= (and start!68676 res!254082) b!309794))

(assert (= (and b!309794 res!254083) b!309795))

(assert (= (and b!309797 condMapEmpty!3007) mapIsEmpty!3008))

(assert (= (and b!309797 (not condMapEmpty!3007)) mapNonEmpty!3007))

(assert (= start!68676 b!309797))

(assert (= (and b!309796 condMapEmpty!3008) mapIsEmpty!3007))

(assert (= (and b!309796 (not condMapEmpty!3008)) mapNonEmpty!3008))

(assert (= start!68676 b!309796))

(declare-fun m!447761 () Bool)

(assert (=> b!309794 m!447761))

(declare-fun m!447763 () Bool)

(assert (=> mapNonEmpty!3008 m!447763))

(declare-fun m!447765 () Bool)

(assert (=> mapNonEmpty!3007 m!447765))

(declare-fun m!447767 () Bool)

(assert (=> start!68676 m!447767))

(declare-fun m!447769 () Bool)

(assert (=> start!68676 m!447769))

(check-sat (not start!68676) (not b!309794) (not mapNonEmpty!3008) (not mapNonEmpty!3007) tp_is_empty!945)
(check-sat)

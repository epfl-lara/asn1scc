; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63976 () Bool)

(assert start!63976)

(declare-fun b!284515 () Bool)

(declare-fun res!235621 () Bool)

(declare-fun e!203378 () Bool)

(assert (=> b!284515 (=> (not res!235621) (not e!203378))))

(declare-datatypes ((T!51307 0))(
  ( (T!51308 (val!210 Int)) )
))
(declare-datatypes ((array!16698 0))(
  ( (array!16699 (arr!8197 (Array (_ BitVec 32) T!51307)) (size!7201 (_ BitVec 32))) )
))
(declare-fun a2!623 () array!16698)

(declare-fun a3!63 () array!16698)

(declare-fun to!716 () (_ BitVec 32))

(declare-fun from!749 () (_ BitVec 32))

(declare-fun arrayRangesEq!1352 (array!16698 array!16698 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!284515 (= res!235621 (arrayRangesEq!1352 a2!623 a3!63 from!749 to!716))))

(declare-fun mapIsEmpty!1152 () Bool)

(declare-fun mapRes!1153 () Bool)

(assert (=> mapIsEmpty!1152 mapRes!1153))

(declare-fun mapIsEmpty!1153 () Bool)

(declare-fun mapRes!1152 () Bool)

(assert (=> mapIsEmpty!1153 mapRes!1152))

(declare-fun mapNonEmpty!1152 () Bool)

(declare-fun mapRes!1154 () Bool)

(declare-fun tp!1153 () Bool)

(declare-fun tp_is_empty!421 () Bool)

(assert (=> mapNonEmpty!1152 (= mapRes!1154 (and tp!1153 tp_is_empty!421))))

(declare-fun mapKey!1153 () (_ BitVec 32))

(declare-fun a1!623 () array!16698)

(declare-fun mapValue!1154 () T!51307)

(declare-fun mapRest!1153 () (Array (_ BitVec 32) T!51307))

(assert (=> mapNonEmpty!1152 (= (arr!8197 a1!623) (store mapRest!1153 mapKey!1153 mapValue!1154))))

(declare-fun res!235620 () Bool)

(assert (=> start!63976 (=> (not res!235620) (not e!203378))))

(declare-fun mid!66 () (_ BitVec 32))

(assert (=> start!63976 (= res!235620 (and (bvsle #b00000000000000000000000000000000 from!749) (bvsle from!749 mid!66) (bvsle mid!66 to!716) (bvsle (size!7201 a1!623) (size!7201 a2!623)) (bvsle (size!7201 a2!623) (size!7201 a3!63)) (bvsle mid!66 (size!7201 a1!623)) (bvsle to!716 (size!7201 a2!623))))))

(assert (=> start!63976 e!203378))

(declare-fun e!203376 () Bool)

(declare-fun array_inv!6888 (array!16698) Bool)

(assert (=> start!63976 (and (array_inv!6888 a2!623) e!203376)))

(declare-fun e!203379 () Bool)

(assert (=> start!63976 (and (array_inv!6888 a1!623) e!203379)))

(assert (=> start!63976 true))

(declare-fun e!203377 () Bool)

(assert (=> start!63976 (and (array_inv!6888 a3!63) e!203377)))

(declare-fun mapNonEmpty!1153 () Bool)

(declare-fun tp!1154 () Bool)

(assert (=> mapNonEmpty!1153 (= mapRes!1153 (and tp!1154 tp_is_empty!421))))

(declare-fun mapRest!1152 () (Array (_ BitVec 32) T!51307))

(declare-fun mapKey!1154 () (_ BitVec 32))

(declare-fun mapValue!1152 () T!51307)

(assert (=> mapNonEmpty!1153 (= (arr!8197 a2!623) (store mapRest!1152 mapKey!1154 mapValue!1152))))

(declare-fun b!284516 () Bool)

(assert (=> b!284516 (= e!203377 (and tp_is_empty!421 mapRes!1152))))

(declare-fun condMapEmpty!1152 () Bool)

(declare-fun mapDefault!1153 () T!51307)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63128 () Bool)

(assert start!63128)

(declare-fun b!282545 () Bool)

(declare-fun e!201883 () Bool)

(declare-datatypes ((T!50079 0))(
  ( (T!50080 (val!146 Int)) )
))
(declare-datatypes ((array!16326 0))(
  ( (array!16327 (arr!8043 (Array (_ BitVec 32) T!50079)) (size!7047 (_ BitVec 32))) )
))
(declare-fun a2!463 () array!16326)

(declare-fun a1!463 () array!16326)

(assert (=> b!282545 (= e!201883 (bvsgt (size!7047 a2!463) (size!7047 a1!463)))))

(declare-fun to!556 () (_ BitVec 32))

(declare-fun from!589 () (_ BitVec 32))

(declare-datatypes ((Unit!19813 0))(
  ( (Unit!19814) )
))
(declare-fun lt!417792 () Unit!19813)

(declare-fun rec!49 (array!16326 array!16326 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19813)

(assert (=> b!282545 (= lt!417792 (rec!49 a1!463 a2!463 from!589 to!556 to!556))))

(declare-fun mapNonEmpty!718 () Bool)

(declare-fun mapRes!719 () Bool)

(declare-fun tp!718 () Bool)

(declare-fun tp_is_empty!293 () Bool)

(assert (=> mapNonEmpty!718 (= mapRes!719 (and tp!718 tp_is_empty!293))))

(declare-fun mapRest!719 () (Array (_ BitVec 32) T!50079))

(declare-fun mapValue!719 () T!50079)

(declare-fun mapKey!719 () (_ BitVec 32))

(assert (=> mapNonEmpty!718 (= (arr!8043 a2!463) (store mapRest!719 mapKey!719 mapValue!719))))

(declare-fun mapIsEmpty!718 () Bool)

(assert (=> mapIsEmpty!718 mapRes!719))

(declare-fun b!282546 () Bool)

(declare-fun e!201884 () Bool)

(assert (=> b!282546 (= e!201884 (and tp_is_empty!293 mapRes!719))))

(declare-fun condMapEmpty!719 () Bool)

(declare-fun mapDefault!718 () T!50079)


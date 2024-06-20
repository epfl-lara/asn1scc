; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64220 () Bool)

(assert start!64220)

(declare-fun mapIsEmpty!2079 () Bool)

(declare-fun mapRes!2079 () Bool)

(assert (=> mapIsEmpty!2079 mapRes!2079))

(declare-fun mapIsEmpty!2080 () Bool)

(declare-fun mapRes!2080 () Bool)

(assert (=> mapIsEmpty!2080 mapRes!2080))

(declare-fun mapNonEmpty!2079 () Bool)

(declare-fun tp!2080 () Bool)

(declare-fun tp_is_empty!641 () Bool)

(assert (=> mapNonEmpty!2079 (= mapRes!2080 (and tp!2080 tp_is_empty!641))))

(declare-datatypes ((T!52247 0))(
  ( (T!52248 (val!320 Int)) )
))
(declare-fun mapValue!2079 () T!52247)

(declare-datatypes ((array!16923 0))(
  ( (array!16924 (arr!8307 (Array (_ BitVec 32) T!52247)) (size!7311 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16923)

(declare-fun mapRest!2080 () (Array (_ BitVec 32) T!52247))

(declare-fun mapKey!2079 () (_ BitVec 32))

(assert (=> mapNonEmpty!2079 (= (arr!8307 a1!596) (store mapRest!2080 mapKey!2079 mapValue!2079))))

(declare-fun a2!596 () array!16923)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun e!204742 () Bool)

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun b!287622 () Bool)

(assert (=> b!287622 (= e!204742 (and (= (select (arr!8307 a1!596) to!689) (select (arr!8307 a2!596) to!689)) (bvsle from!722 i!953) (bvsle i!953 to!689) (or (bvsgt #b00000000000000000000000000000000 i!953) (bvsgt i!953 (bvadd #b00000000000000000000000000000001 to!689)))))))

(declare-fun b!287623 () Bool)

(declare-fun e!204741 () Bool)

(assert (=> b!287623 (= e!204741 (and tp_is_empty!641 mapRes!2080))))

(declare-fun condMapEmpty!2080 () Bool)

(declare-fun mapDefault!2080 () T!52247)


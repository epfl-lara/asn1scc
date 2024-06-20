; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64274 () Bool)

(assert start!64274)

(declare-fun mapNonEmpty!2241 () Bool)

(declare-fun mapRes!2241 () Bool)

(declare-fun tp!2242 () Bool)

(declare-fun tp_is_empty!695 () Bool)

(assert (=> mapNonEmpty!2241 (= mapRes!2241 (and tp!2242 tp_is_empty!695))))

(declare-datatypes ((T!52481 0))(
  ( (T!52482 (val!347 Int)) )
))
(declare-datatypes ((array!16977 0))(
  ( (array!16978 (arr!8334 (Array (_ BitVec 32) T!52481)) (size!7338 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16977)

(declare-fun mapValue!2241 () T!52481)

(declare-fun mapRest!2242 () (Array (_ BitVec 32) T!52481))

(declare-fun mapKey!2242 () (_ BitVec 32))

(assert (=> mapNonEmpty!2241 (= (arr!8334 a1!596) (store mapRest!2242 mapKey!2242 mapValue!2241))))

(declare-fun mapNonEmpty!2242 () Bool)

(declare-fun mapRes!2242 () Bool)

(declare-fun tp!2241 () Bool)

(assert (=> mapNonEmpty!2242 (= mapRes!2242 (and tp!2241 tp_is_empty!695))))

(declare-fun mapValue!2242 () T!52481)

(declare-fun mapKey!2241 () (_ BitVec 32))

(declare-fun a2!596 () array!16977)

(declare-fun mapRest!2241 () (Array (_ BitVec 32) T!52481))

(assert (=> mapNonEmpty!2242 (= (arr!8334 a2!596) (store mapRest!2241 mapKey!2241 mapValue!2242))))

(declare-fun b!288187 () Bool)

(declare-fun res!238221 () Bool)

(declare-fun e!205011 () Bool)

(assert (=> b!288187 (=> (not res!238221) (not e!205011))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> b!288187 (= res!238221 (and (= (select (arr!8334 a1!596) to!689) (select (arr!8334 a2!596) to!689)) (bvsle i!953 to!689)))))

(declare-fun b!288188 () Bool)

(declare-fun e!205012 () Bool)

(assert (=> b!288188 (= e!205012 (and tp_is_empty!695 mapRes!2241))))

(declare-fun condMapEmpty!2242 () Bool)

(declare-fun mapDefault!2242 () T!52481)


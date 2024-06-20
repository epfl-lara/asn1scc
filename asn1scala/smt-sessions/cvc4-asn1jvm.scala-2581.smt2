; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64280 () Bool)

(assert start!64280)

(declare-fun mapIsEmpty!2259 () Bool)

(declare-fun mapRes!2260 () Bool)

(assert (=> mapIsEmpty!2259 mapRes!2260))

(declare-fun mapNonEmpty!2259 () Bool)

(declare-fun tp!2260 () Bool)

(declare-fun tp_is_empty!701 () Bool)

(assert (=> mapNonEmpty!2259 (= mapRes!2260 (and tp!2260 tp_is_empty!701))))

(declare-datatypes ((T!52507 0))(
  ( (T!52508 (val!350 Int)) )
))
(declare-datatypes ((array!16983 0))(
  ( (array!16984 (arr!8337 (Array (_ BitVec 32) T!52507)) (size!7341 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16983)

(declare-fun mapValue!2260 () T!52507)

(declare-fun mapRest!2259 () (Array (_ BitVec 32) T!52507))

(declare-fun mapKey!2259 () (_ BitVec 32))

(assert (=> mapNonEmpty!2259 (= (arr!8337 a2!596) (store mapRest!2259 mapKey!2259 mapValue!2260))))

(declare-fun b!288249 () Bool)

(declare-fun res!238263 () Bool)

(declare-fun e!205040 () Bool)

(assert (=> b!288249 (=> (not res!238263) (not e!205040))))

(declare-fun a1!596 () array!16983)

(declare-fun from!722 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(declare-fun arrayRangesEq!1450 (array!16983 array!16983 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!288249 (= res!238263 (arrayRangesEq!1450 a1!596 a2!596 from!722 to!689))))

(declare-fun res!238266 () Bool)

(assert (=> start!64280 (=> (not res!238266) (not e!205040))))

(assert (=> start!64280 (= res!238266 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7341 a1!596) (size!7341 a2!596)) (bvslt to!689 (size!7341 a1!596))))))

(assert (=> start!64280 e!205040))

(declare-fun e!205038 () Bool)

(declare-fun array_inv!6964 (array!16983) Bool)

(assert (=> start!64280 (and (array_inv!6964 a1!596) e!205038)))

(declare-fun e!205039 () Bool)

(assert (=> start!64280 (and (array_inv!6964 a2!596) e!205039)))

(assert (=> start!64280 true))

(declare-fun mapIsEmpty!2260 () Bool)

(declare-fun mapRes!2259 () Bool)

(assert (=> mapIsEmpty!2260 mapRes!2259))

(declare-fun b!288250 () Bool)

(assert (=> b!288250 (= e!205038 (and tp_is_empty!701 mapRes!2259))))

(declare-fun condMapEmpty!2260 () Bool)

(declare-fun mapDefault!2259 () T!52507)


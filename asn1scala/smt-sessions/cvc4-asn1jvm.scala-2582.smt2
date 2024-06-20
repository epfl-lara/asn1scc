; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64286 () Bool)

(assert start!64286)

(declare-fun b!288304 () Bool)

(declare-fun e!205067 () Bool)

(declare-fun i!953 () (_ BitVec 32))

(declare-fun from!722 () (_ BitVec 32))

(assert (=> b!288304 (= e!205067 (and (not (= i!953 from!722)) (not (= (bvand i!953 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand i!953 #b10000000000000000000000000000000) (bvand (bvsub i!953 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun res!238302 () Bool)

(assert (=> start!64286 (=> (not res!238302) (not e!205067))))

(declare-datatypes ((T!52533 0))(
  ( (T!52534 (val!353 Int)) )
))
(declare-datatypes ((array!16989 0))(
  ( (array!16990 (arr!8340 (Array (_ BitVec 32) T!52533)) (size!7344 (_ BitVec 32))) )
))
(declare-fun a1!596 () array!16989)

(declare-fun a2!596 () array!16989)

(declare-fun to!689 () (_ BitVec 32))

(assert (=> start!64286 (= res!238302 (and (bvsle #b00000000000000000000000000000000 from!722) (bvsle from!722 to!689) (bvsle (size!7344 a1!596) (size!7344 a2!596)) (bvslt to!689 (size!7344 a1!596))))))

(assert (=> start!64286 e!205067))

(declare-fun e!205065 () Bool)

(declare-fun array_inv!6967 (array!16989) Bool)

(assert (=> start!64286 (and (array_inv!6967 a1!596) e!205065)))

(declare-fun e!205066 () Bool)

(assert (=> start!64286 (and (array_inv!6967 a2!596) e!205066)))

(assert (=> start!64286 true))

(declare-fun mapNonEmpty!2277 () Bool)

(declare-fun mapRes!2277 () Bool)

(declare-fun tp!2278 () Bool)

(declare-fun tp_is_empty!707 () Bool)

(assert (=> mapNonEmpty!2277 (= mapRes!2277 (and tp!2278 tp_is_empty!707))))

(declare-fun mapValue!2277 () T!52533)

(declare-fun mapKey!2278 () (_ BitVec 32))

(declare-fun mapRest!2277 () (Array (_ BitVec 32) T!52533))

(assert (=> mapNonEmpty!2277 (= (arr!8340 a2!596) (store mapRest!2277 mapKey!2278 mapValue!2277))))

(declare-fun mapIsEmpty!2277 () Bool)

(declare-fun mapRes!2278 () Bool)

(assert (=> mapIsEmpty!2277 mapRes!2278))

(declare-fun b!288305 () Bool)

(assert (=> b!288305 (= e!205065 (and tp_is_empty!707 mapRes!2278))))

(declare-fun condMapEmpty!2277 () Bool)

(declare-fun mapDefault!2278 () T!52533)


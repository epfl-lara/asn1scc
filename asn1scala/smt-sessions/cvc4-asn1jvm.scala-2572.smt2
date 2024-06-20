; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64226 () Bool)

(assert start!64226)

(declare-fun mapNonEmpty!2097 () Bool)

(declare-fun mapRes!2097 () Bool)

(declare-fun tp!2098 () Bool)

(declare-fun tp_is_empty!647 () Bool)

(assert (=> mapNonEmpty!2097 (= mapRes!2097 (and tp!2098 tp_is_empty!647))))

(declare-datatypes ((T!52273 0))(
  ( (T!52274 (val!323 Int)) )
))
(declare-fun mapValue!2098 () T!52273)

(declare-fun mapRest!2097 () (Array (_ BitVec 32) T!52273))

(declare-datatypes ((array!16929 0))(
  ( (array!16930 (arr!8310 (Array (_ BitVec 32) T!52273)) (size!7314 (_ BitVec 32))) )
))
(declare-fun a2!596 () array!16929)

(declare-fun mapKey!2097 () (_ BitVec 32))

(assert (=> mapNonEmpty!2097 (= (arr!8310 a2!596) (store mapRest!2097 mapKey!2097 mapValue!2098))))

(declare-fun mapNonEmpty!2098 () Bool)

(declare-fun mapRes!2098 () Bool)

(declare-fun tp!2097 () Bool)

(assert (=> mapNonEmpty!2098 (= mapRes!2098 (and tp!2097 tp_is_empty!647))))

(declare-fun a1!596 () array!16929)

(declare-fun mapRest!2098 () (Array (_ BitVec 32) T!52273))

(declare-fun mapKey!2098 () (_ BitVec 32))

(declare-fun mapValue!2097 () T!52273)

(assert (=> mapNonEmpty!2098 (= (arr!8310 a1!596) (store mapRest!2098 mapKey!2098 mapValue!2097))))

(declare-fun b!287674 () Bool)

(declare-fun res!237853 () Bool)

(declare-fun e!204770 () Bool)

(assert (=> b!287674 (=> (not res!237853) (not e!204770))))

(declare-fun i!953 () (_ BitVec 32))

(declare-fun to!689 () (_ BitVec 32))

(assert (=> b!287674 (= res!237853 (and (= (select (arr!8310 a1!596) to!689) (select (arr!8310 a2!596) to!689)) (bvsle i!953 to!689)))))

(declare-fun b!287675 () Bool)

(declare-fun e!204768 () Bool)

(assert (=> b!287675 (= e!204768 (and tp_is_empty!647 mapRes!2097))))

(declare-fun condMapEmpty!2098 () Bool)

(declare-fun mapDefault!2097 () T!52273)


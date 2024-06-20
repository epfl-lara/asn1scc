; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64110 () Bool)

(assert start!64110)

(declare-fun b!286470 () Bool)

(declare-fun res!237009 () Bool)

(declare-fun e!204186 () Bool)

(assert (=> b!286470 (=> (not res!237009) (not e!204186))))

(declare-fun i!964 () (_ BitVec 32))

(declare-datatypes ((T!51853 0))(
  ( (T!51854 (val!273 Int)) )
))
(declare-datatypes ((array!16826 0))(
  ( (array!16827 (arr!8260 (Array (_ BitVec 32) T!51853)) (size!7264 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16826)

(declare-fun a3!68 () array!16826)

(declare-fun from!773 () (_ BitVec 32))

(declare-fun arrayRangesEq!1402 (array!16826 array!16826 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286470 (= res!237009 (arrayRangesEq!1402 a1!647 a3!68 from!773 i!964))))

(declare-fun b!286471 () Bool)

(declare-fun res!237010 () Bool)

(assert (=> b!286471 (=> (not res!237010) (not e!204186))))

(declare-fun a2!647 () array!16826)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!286471 (= res!237010 (arrayRangesEq!1402 a2!647 a3!68 from!773 to!740))))

(declare-fun mapIsEmpty!1729 () Bool)

(declare-fun mapRes!1729 () Bool)

(assert (=> mapIsEmpty!1729 mapRes!1729))

(declare-fun mapNonEmpty!1729 () Bool)

(declare-fun mapRes!1730 () Bool)

(declare-fun tp!1731 () Bool)

(declare-fun tp_is_empty!547 () Bool)

(assert (=> mapNonEmpty!1729 (= mapRes!1730 (and tp!1731 tp_is_empty!547))))

(declare-fun mapRest!1729 () (Array (_ BitVec 32) T!51853))

(declare-fun mapValue!1730 () T!51853)

(declare-fun mapKey!1731 () (_ BitVec 32))

(assert (=> mapNonEmpty!1729 (= (arr!8260 a3!68) (store mapRest!1729 mapKey!1731 mapValue!1730))))

(declare-fun res!237011 () Bool)

(assert (=> start!64110 (=> (not res!237011) (not e!204186))))

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> start!64110 (= res!237011 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7264 a1!647) (size!7264 a2!647)) (bvsle (size!7264 a2!647) (size!7264 a3!68)) (bvsle mid!71 (size!7264 a1!647)) (bvsle to!740 (size!7264 a2!647))))))

(assert (=> start!64110 e!204186))

(declare-fun e!204183 () Bool)

(declare-fun array_inv!6918 (array!16826) Bool)

(assert (=> start!64110 (and (array_inv!6918 a2!647) e!204183)))

(assert (=> start!64110 true))

(declare-fun e!204184 () Bool)

(assert (=> start!64110 (and (array_inv!6918 a1!647) e!204184)))

(declare-fun e!204185 () Bool)

(assert (=> start!64110 (and (array_inv!6918 a3!68) e!204185)))

(declare-fun b!286472 () Bool)

(declare-fun res!237008 () Bool)

(assert (=> b!286472 (=> (not res!237008) (not e!204186))))

(assert (=> b!286472 (= res!237008 (arrayRangesEq!1402 a2!647 a3!68 i!964 to!740))))

(declare-fun mapIsEmpty!1730 () Bool)

(declare-fun mapRes!1731 () Bool)

(assert (=> mapIsEmpty!1730 mapRes!1731))

(declare-fun b!286473 () Bool)

(assert (=> b!286473 (= e!204183 (and tp_is_empty!547 mapRes!1731))))

(declare-fun condMapEmpty!1729 () Bool)

(declare-fun mapDefault!1731 () T!51853)


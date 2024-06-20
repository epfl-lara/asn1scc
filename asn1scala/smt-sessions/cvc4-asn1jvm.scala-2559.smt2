; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64144 () Bool)

(assert start!64144)

(declare-fun mapNonEmpty!1838 () Bool)

(declare-fun mapRes!1839 () Bool)

(declare-fun tp!1840 () Bool)

(declare-fun tp_is_empty!569 () Bool)

(assert (=> mapNonEmpty!1838 (= mapRes!1839 (and tp!1840 tp_is_empty!569))))

(declare-datatypes ((T!51935 0))(
  ( (T!51936 (val!284 Int)) )
))
(declare-datatypes ((array!16850 0))(
  ( (array!16851 (arr!8271 (Array (_ BitVec 32) T!51935)) (size!7275 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16850)

(declare-fun mapRest!1838 () (Array (_ BitVec 32) T!51935))

(declare-fun mapKey!1840 () (_ BitVec 32))

(declare-fun mapValue!1838 () T!51935)

(assert (=> mapNonEmpty!1838 (= (arr!8271 a2!647) (store mapRest!1838 mapKey!1840 mapValue!1838))))

(declare-fun res!237341 () Bool)

(declare-fun e!204378 () Bool)

(assert (=> start!64144 (=> (not res!237341) (not e!204378))))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(declare-fun a1!647 () array!16850)

(declare-fun a3!68 () array!16850)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> start!64144 (= res!237341 (and (bvsle #b00000000000000000000000000000000 from!773) (bvsle from!773 mid!71) (bvsle mid!71 to!740) (bvsle (size!7275 a1!647) (size!7275 a2!647)) (bvsle (size!7275 a2!647) (size!7275 a3!68)) (bvsle mid!71 (size!7275 a1!647)) (bvsle to!740 (size!7275 a2!647))))))

(assert (=> start!64144 e!204378))

(declare-fun e!204377 () Bool)

(declare-fun array_inv!6926 (array!16850) Bool)

(assert (=> start!64144 (and (array_inv!6926 a2!647) e!204377)))

(assert (=> start!64144 true))

(declare-fun e!204380 () Bool)

(assert (=> start!64144 (and (array_inv!6926 a1!647) e!204380)))

(declare-fun e!204379 () Bool)

(assert (=> start!64144 (and (array_inv!6926 a3!68) e!204379)))

(declare-fun b!286908 () Bool)

(declare-fun res!237342 () Bool)

(assert (=> b!286908 (=> (not res!237342) (not e!204378))))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun arrayRangesEq!1410 (array!16850 array!16850 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286908 (= res!237342 (arrayRangesEq!1410 a2!647 a3!68 i!964 to!740))))

(declare-fun b!286909 () Bool)

(declare-fun res!237339 () Bool)

(assert (=> b!286909 (=> (not res!237339) (not e!204378))))

(assert (=> b!286909 (= res!237339 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!286910 () Bool)

(declare-fun mapRes!1838 () Bool)

(assert (=> b!286910 (= e!204380 (and tp_is_empty!569 mapRes!1838))))

(declare-fun condMapEmpty!1839 () Bool)

(declare-fun mapDefault!1839 () T!51935)


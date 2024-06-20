; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64098 () Bool)

(assert start!64098)

(declare-fun b!286323 () Bool)

(declare-fun res!236898 () Bool)

(declare-fun e!204123 () Bool)

(assert (=> b!286323 (=> (not res!236898) (not e!204123))))

(declare-datatypes ((T!51805 0))(
  ( (T!51806 (val!269 Int)) )
))
(declare-datatypes ((array!16817 0))(
  ( (array!16818 (arr!8256 (Array (_ BitVec 32) T!51805)) (size!7260 (_ BitVec 32))) )
))
(declare-fun a2!647 () array!16817)

(declare-fun i!964 () (_ BitVec 32))

(declare-fun a3!68 () array!16817)

(declare-fun to!740 () (_ BitVec 32))

(declare-fun arrayRangesEq!1399 (array!16817 array!16817 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286323 (= res!236898 (arrayRangesEq!1399 a2!647 a3!68 i!964 to!740))))

(declare-fun b!286324 () Bool)

(declare-fun a1!647 () array!16817)

(declare-fun mid!71 () (_ BitVec 32))

(assert (=> b!286324 (= e!204123 (and (not (= i!964 mid!71)) (bvsle (size!7260 a1!647) (size!7260 a3!68)) (bvslt i!964 (size!7260 a1!647)) (not (= (select (arr!8256 a1!647) i!964) (select (arr!8256 a3!68) i!964)))))))

(declare-fun b!286325 () Bool)

(declare-fun res!236895 () Bool)

(assert (=> b!286325 (=> (not res!236895) (not e!204123))))

(declare-fun from!773 () (_ BitVec 32))

(assert (=> b!286325 (= res!236895 (arrayRangesEq!1399 a2!647 a3!68 from!773 to!740))))

(declare-fun b!286326 () Bool)

(declare-fun res!236899 () Bool)

(assert (=> b!286326 (=> (not res!236899) (not e!204123))))

(assert (=> b!286326 (= res!236899 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun mapIsEmpty!1688 () Bool)

(declare-fun mapRes!1689 () Bool)

(assert (=> mapIsEmpty!1688 mapRes!1689))

(declare-fun b!286328 () Bool)

(declare-fun e!204124 () Bool)

(declare-fun tp_is_empty!539 () Bool)

(assert (=> b!286328 (= e!204124 (and tp_is_empty!539 mapRes!1689))))

(declare-fun condMapEmpty!1689 () Bool)

(declare-fun mapDefault!1689 () T!51805)


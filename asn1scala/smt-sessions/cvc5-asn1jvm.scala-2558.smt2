; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64128 () Bool)

(assert start!64128)

(declare-fun b!286704 () Bool)

(declare-fun e!204289 () Bool)

(declare-fun e!204287 () Bool)

(assert (=> b!286704 (= e!204289 (not e!204287))))

(declare-fun res!237189 () Bool)

(assert (=> b!286704 (=> res!237189 e!204287)))

(declare-fun i!964 () (_ BitVec 32))

(declare-fun mid!71 () (_ BitVec 32))

(declare-fun from!773 () (_ BitVec 32))

(assert (=> b!286704 (= res!237189 (or (bvsgt from!773 (bvadd #b00000000000000000000000000000001 i!964)) (bvsgt (bvadd #b00000000000000000000000000000001 i!964) mid!71)))))

(declare-datatypes ((T!51905 0))(
  ( (T!51906 (val!279 Int)) )
))
(declare-datatypes ((array!16839 0))(
  ( (array!16840 (arr!8266 (Array (_ BitVec 32) T!51905)) (size!7270 (_ BitVec 32))) )
))
(declare-fun a1!647 () array!16839)

(declare-fun a3!68 () array!16839)

(declare-fun arrayRangesEq!1407 (array!16839 array!16839 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!286704 (arrayRangesEq!1407 a1!647 a3!68 from!773 (bvadd #b00000000000000000000000000000001 i!964))))

(declare-datatypes ((Unit!19951 0))(
  ( (Unit!19952) )
))
(declare-fun lt!418665 () Unit!19951)

(declare-fun arrayRangesEqAppend!17 (array!16839 array!16839 (_ BitVec 32) (_ BitVec 32)) Unit!19951)

(assert (=> b!286704 (= lt!418665 (arrayRangesEqAppend!17 a1!647 a3!68 from!773 i!964))))

(declare-fun b!286705 () Bool)

(declare-fun res!237190 () Bool)

(assert (=> b!286705 (=> (not res!237190) (not e!204289))))

(declare-fun a2!647 () array!16839)

(assert (=> b!286705 (= res!237190 (arrayRangesEq!1407 a1!647 a2!647 i!964 mid!71))))

(declare-fun b!286706 () Bool)

(declare-fun to!740 () (_ BitVec 32))

(assert (=> b!286706 (= e!204287 (arrayRangesEq!1407 a2!647 a3!68 (bvadd #b00000000000000000000000000000001 i!964) to!740))))

(declare-fun mapIsEmpty!1788 () Bool)

(declare-fun mapRes!1788 () Bool)

(assert (=> mapIsEmpty!1788 mapRes!1788))

(declare-fun b!286708 () Bool)

(declare-fun res!237187 () Bool)

(assert (=> b!286708 (=> (not res!237187) (not e!204289))))

(assert (=> b!286708 (= res!237187 (and (bvsle from!773 i!964) (bvsle i!964 mid!71)))))

(declare-fun b!286709 () Bool)

(declare-fun e!204288 () Bool)

(declare-fun tp_is_empty!559 () Bool)

(declare-fun mapRes!1790 () Bool)

(assert (=> b!286709 (= e!204288 (and tp_is_empty!559 mapRes!1790))))

(declare-fun condMapEmpty!1789 () Bool)

(declare-fun mapDefault!1789 () T!51905)


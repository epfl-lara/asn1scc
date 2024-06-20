; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68576 () Bool)

(assert start!68576)

(declare-fun b!308615 () Bool)

(declare-fun e!222134 () Bool)

(assert (=> b!308615 (= e!222134 true)))

(declare-fun fromSlice!46 () (_ BitVec 32))

(declare-fun toSlice!46 () (_ BitVec 32))

(declare-datatypes ((T!57903 0))(
  ( (T!57904 (val!428 Int)) )
))
(declare-datatypes ((array!18721 0))(
  ( (array!18722 (arr!9198 (Array (_ BitVec 32) T!57903)) (size!8115 (_ BitVec 32))) )
))
(declare-fun a2!524 () array!18721)

(declare-fun a1!524 () array!18721)

(declare-fun arrayRangesEq!1731 (array!18721 array!18721 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!308615 (arrayRangesEq!1731 a1!524 a2!524 fromSlice!46 toSlice!46)))

(declare-fun from!650 () (_ BitVec 32))

(declare-fun to!617 () (_ BitVec 32))

(declare-fun i!932 () (_ BitVec 32))

(declare-datatypes ((Unit!21469 0))(
  ( (Unit!21470) )
))
(declare-fun lt!440330 () Unit!21469)

(declare-fun rec!99 (array!18721 array!18721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21469)

(assert (=> b!308615 (= lt!440330 (rec!99 a1!524 a2!524 from!650 fromSlice!46 to!617 toSlice!46 (bvsub i!932 #b00000000000000000000000000000001)))))

(declare-fun b!308616 () Bool)

(declare-fun res!253177 () Bool)

(assert (=> b!308616 (=> res!253177 e!222134)))

(declare-fun e!222137 () Bool)

(assert (=> b!308616 (= res!253177 e!222137)))

(declare-fun res!253176 () Bool)

(assert (=> b!308616 (=> (not res!253176) (not e!222137))))

(assert (=> b!308616 (= res!253176 (bvsle (bvsub i!932 #b00000000000000000000000000000001) toSlice!46))))

(declare-fun b!308617 () Bool)

(declare-fun res!253173 () Bool)

(declare-fun e!222136 () Bool)

(assert (=> b!308617 (=> (not res!253173) (not e!222136))))

(declare-fun e!222135 () Bool)

(assert (=> b!308617 (= res!253173 e!222135)))

(declare-fun res!253172 () Bool)

(assert (=> b!308617 (=> res!253172 e!222135)))

(assert (=> b!308617 (= res!253172 (bvsgt i!932 toSlice!46))))

(declare-fun b!308618 () Bool)

(declare-fun res!253179 () Bool)

(assert (=> b!308618 (=> (not res!253179) (not e!222136))))

(assert (=> b!308618 (= res!253179 (arrayRangesEq!1731 a1!524 a2!524 from!650 to!617))))

(declare-fun mapNonEmpty!2735 () Bool)

(declare-fun mapRes!2736 () Bool)

(declare-fun tp!2735 () Bool)

(declare-fun tp_is_empty!857 () Bool)

(assert (=> mapNonEmpty!2735 (= mapRes!2736 (and tp!2735 tp_is_empty!857))))

(declare-fun mapKey!2736 () (_ BitVec 32))

(declare-fun mapRest!2736 () (Array (_ BitVec 32) T!57903))

(declare-fun mapValue!2735 () T!57903)

(assert (=> mapNonEmpty!2735 (= (arr!9198 a2!524) (store mapRest!2736 mapKey!2736 mapValue!2735))))

(declare-fun b!308619 () Bool)

(declare-fun e!222138 () Bool)

(assert (=> b!308619 (= e!222138 (and tp_is_empty!857 mapRes!2736))))

(declare-fun condMapEmpty!2736 () Bool)

(declare-fun mapDefault!2735 () T!57903)


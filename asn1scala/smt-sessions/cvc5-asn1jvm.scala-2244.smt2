; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57106 () Bool)

(assert start!57106)

(declare-fun res!219208 () Bool)

(declare-fun e!182289 () Bool)

(assert (=> start!57106 (=> (not res!219208) (not e!182289))))

(declare-fun at!213 () (_ BitVec 32))

(declare-datatypes ((T!45247 0))(
  ( (T!45248 (val!90 Int)) )
))
(declare-datatypes ((array!14523 0))(
  ( (array!14524 (arr!7324 (Array (_ BitVec 32) T!45247)) (size!6337 (_ BitVec 32))) )
))
(declare-fun a!411 () array!14523)

(assert (=> start!57106 (= res!219208 (and (bvsle #b00000000000000000000000000000000 at!213) (bvslt at!213 (size!6337 a!411))))))

(assert (=> start!57106 e!182289))

(assert (=> start!57106 true))

(declare-fun e!182290 () Bool)

(declare-fun array_inv!6075 (array!14523) Bool)

(assert (=> start!57106 (and (array_inv!6075 a!411) e!182290)))

(declare-fun tp_is_empty!181 () Bool)

(assert (=> start!57106 tp_is_empty!181))

(declare-fun b!261876 () Bool)

(declare-fun e!182288 () Bool)

(assert (=> b!261876 (= e!182288 (not (bvsle at!213 (size!6337 a!411))))))

(declare-fun lt!403921 () array!14523)

(declare-fun arrayRangesEq!960 (array!14523 array!14523 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!261876 (arrayRangesEq!960 a!411 lt!403921 #b00000000000000000000000000000000 at!213)))

(declare-fun v!328 () T!45247)

(declare-datatypes ((Unit!18681 0))(
  ( (Unit!18682) )
))
(declare-fun lt!403922 () Unit!18681)

(declare-fun rec!28 (array!14523 (_ BitVec 32) T!45247 (_ BitVec 32)) Unit!18681)

(assert (=> b!261876 (= lt!403922 (rec!28 a!411 at!213 v!328 at!213))))

(declare-fun b!261877 () Bool)

(declare-fun mapRes!514 () Bool)

(assert (=> b!261877 (= e!182290 (and tp_is_empty!181 mapRes!514))))

(declare-fun condMapEmpty!514 () Bool)

(declare-fun mapDefault!514 () T!45247)


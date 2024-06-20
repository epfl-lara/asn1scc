; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4610 () Bool)

(assert start!4610)

(declare-fun b!18643 () Bool)

(declare-fun res!16358 () Bool)

(declare-fun e!11966 () Bool)

(assert (=> b!18643 (=> (not res!16358) (not e!11966))))

(declare-fun lt!26877 () (_ BitVec 64))

(declare-fun atByte!6 () (_ BitVec 32))

(declare-fun from!908 () (_ BitVec 64))

(assert (=> b!18643 (= res!16358 (and (bvsle lt!26877 from!908) (bvsle from!908 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) atByte!6)))))))

(declare-fun b!18641 () Bool)

(declare-fun e!11965 () Bool)

(assert (=> b!18641 (= e!11965 e!11966)))

(declare-fun res!16361 () Bool)

(assert (=> b!18641 (=> (not res!16361) (not e!11966))))

(declare-fun to!875 () (_ BitVec 64))

(assert (=> b!18641 (= res!16361 (and (bvsle lt!26877 ((_ sign_extend 32) atByte!6)) (bvslt ((_ sign_extend 32) atByte!6) (bvsdiv to!875 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!18641 (= lt!26877 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 from!908) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun b!18644 () Bool)

(declare-datatypes ((array!1260 0))(
  ( (array!1261 (arr!972 (Array (_ BitVec 32) (_ BitVec 8))) (size!531 (_ BitVec 32))) )
))
(declare-fun a1!923 () array!1260)

(assert (=> b!18644 (= e!11966 (not (and (bvsge atByte!6 #b00000000000000000000000000000000) (bvslt atByte!6 (size!531 a1!923)))))))

(declare-fun a2!923 () array!1260)

(assert (=> b!18644 (= ((_ sign_extend 24) (select (arr!972 a1!923) atByte!6)) ((_ sign_extend 24) (select (arr!972 a2!923) atByte!6)))))

(declare-datatypes ((Unit!1648 0))(
  ( (Unit!1649) )
))
(declare-fun lt!26878 () Unit!1648)

(declare-fun rec!23 (array!1260 array!1260 (_ BitVec 32) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1648)

(assert (=> b!18644 (= lt!26878 (rec!23 a1!923 a2!923 atByte!6 from!908 to!875 from!908))))

(declare-fun b!18642 () Bool)

(declare-fun res!16359 () Bool)

(assert (=> b!18642 (=> (not res!16359) (not e!11966))))

(declare-fun arrayBitRangesEq!0 (array!1260 array!1260 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18642 (= res!16359 (arrayBitRangesEq!0 a1!923 a2!923 from!908 to!875))))

(declare-fun res!16360 () Bool)

(assert (=> start!4610 (=> (not res!16360) (not e!11965))))

(assert (=> start!4610 (= res!16360 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!908) (bvsle from!908 to!875) (= (size!531 a1!923) (size!531 a2!923)) (bvsle to!875 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!531 a1!923))))))))

(assert (=> start!4610 e!11965))

(declare-fun array_inv!501 (array!1260) Bool)

(assert (=> start!4610 (array_inv!501 a2!923)))

(assert (=> start!4610 (array_inv!501 a1!923)))

(assert (=> start!4610 true))

(assert (= (and start!4610 res!16360) b!18641))

(assert (= (and b!18641 res!16361) b!18642))

(assert (= (and b!18642 res!16359) b!18643))

(assert (= (and b!18643 res!16358) b!18644))

(declare-fun m!25051 () Bool)

(assert (=> b!18644 m!25051))

(declare-fun m!25053 () Bool)

(assert (=> b!18644 m!25053))

(declare-fun m!25055 () Bool)

(assert (=> b!18644 m!25055))

(declare-fun m!25057 () Bool)

(assert (=> b!18642 m!25057))

(declare-fun m!25059 () Bool)

(assert (=> start!4610 m!25059))

(declare-fun m!25061 () Bool)

(assert (=> start!4610 m!25061))

(push 1)

(assert (not start!4610))

(assert (not b!18644))

(assert (not b!18642))

(check-sat)

(pop 1)

(push 1)

(check-sat)


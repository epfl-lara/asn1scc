; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58024 () Bool)

(assert start!58024)

(declare-fun b!266279 () Bool)

(declare-fun e!186206 () Bool)

(declare-fun e!186205 () Bool)

(assert (=> b!266279 (= e!186206 (not e!186205))))

(declare-fun res!222472 () Bool)

(assert (=> b!266279 (=> res!222472 e!186205)))

(declare-fun e!186210 () Bool)

(assert (=> b!266279 (= res!222472 e!186210)))

(declare-fun res!222471 () Bool)

(assert (=> b!266279 (=> (not res!222471) (not e!186210))))

(declare-datatypes ((array!14838 0))(
  ( (array!14839 (arr!7455 (Array (_ BitVec 32) (_ BitVec 8))) (size!6468 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11750 0))(
  ( (BitStream!11751 (buf!6936 array!14838) (currentByte!12830 (_ BitVec 32)) (currentBit!12825 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11750)

(assert (=> b!266279 (= res!222471 (not (= (size!6468 (buf!6936 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun w2!580 () BitStream!11750)

(declare-fun isPrefixOf!0 (BitStream!11750 BitStream!11750) Bool)

(assert (=> b!266279 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18903 0))(
  ( (Unit!18904) )
))
(declare-fun lt!407030 () Unit!18903)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11750) Unit!18903)

(assert (=> b!266279 (= lt!407030 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!407029 () BitStream!11750)

(assert (=> b!266279 (isPrefixOf!0 lt!407029 lt!407029)))

(declare-fun lt!407027 () Unit!18903)

(assert (=> b!266279 (= lt!407027 (lemmaIsPrefixRefl!0 lt!407029))))

(assert (=> b!266279 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!407026 () Unit!18903)

(assert (=> b!266279 (= lt!407026 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!266279 (= lt!407029 (BitStream!11751 (buf!6936 w2!580) (currentByte!12830 w1!584) (currentBit!12825 w1!584)))))

(declare-fun b!266280 () Bool)

(declare-fun e!186209 () Bool)

(declare-fun array_inv!6192 (array!14838) Bool)

(assert (=> b!266280 (= e!186209 (array_inv!6192 (buf!6936 w2!580)))))

(declare-fun b!266281 () Bool)

(declare-fun e!186204 () Bool)

(assert (=> b!266281 (= e!186205 e!186204)))

(declare-fun res!222475 () Bool)

(assert (=> b!266281 (=> res!222475 e!186204)))

(declare-fun lt!407028 () (_ BitVec 64))

(assert (=> b!266281 (= res!222475 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!407028) (not (= (size!6468 (buf!6936 w1!584)) (size!6468 (buf!6936 w2!580)))) (bvsgt lt!407028 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6468 (buf!6936 w1!584)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!266281 (= lt!407028 (bitIndex!0 (size!6468 (buf!6936 w1!584)) (currentByte!12830 w1!584) (currentBit!12825 w1!584)))))

(declare-fun res!222474 () Bool)

(assert (=> start!58024 (=> (not res!222474) (not e!186206))))

(assert (=> start!58024 (= res!222474 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!58024 e!186206))

(declare-fun e!186208 () Bool)

(declare-fun inv!12 (BitStream!11750) Bool)

(assert (=> start!58024 (and (inv!12 w1!584) e!186208)))

(assert (=> start!58024 (and (inv!12 w2!580) e!186209)))

(declare-fun b!266282 () Bool)

(declare-fun res!222473 () Bool)

(assert (=> b!266282 (=> res!222473 e!186205)))

(assert (=> b!266282 (= res!222473 (= (size!6468 (buf!6936 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!266283 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14838 array!14838 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!266283 (= e!186210 (not (arrayBitRangesEq!0 (buf!6936 w1!584) (buf!6936 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6468 (buf!6936 w1!584)) (currentByte!12830 w1!584) (currentBit!12825 w1!584)))))))

(declare-fun b!266284 () Bool)

(assert (=> b!266284 (= e!186208 (array_inv!6192 (buf!6936 w1!584)))))

(declare-fun b!266285 () Bool)

(assert (=> b!266285 (= e!186204 (arrayBitRangesEq!0 (buf!6936 w1!584) (buf!6936 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!407028))))

(assert (= (and start!58024 res!222474) b!266279))

(assert (= (and b!266279 res!222471) b!266283))

(assert (= (and b!266279 (not res!222472)) b!266282))

(assert (= (and b!266282 (not res!222473)) b!266281))

(assert (= (and b!266281 (not res!222475)) b!266285))

(assert (= start!58024 b!266284))

(assert (= start!58024 b!266280))

(declare-fun m!397051 () Bool)

(assert (=> b!266285 m!397051))

(declare-fun m!397053 () Bool)

(assert (=> b!266280 m!397053))

(declare-fun m!397055 () Bool)

(assert (=> b!266281 m!397055))

(declare-fun m!397057 () Bool)

(assert (=> b!266279 m!397057))

(declare-fun m!397059 () Bool)

(assert (=> b!266279 m!397059))

(declare-fun m!397061 () Bool)

(assert (=> b!266279 m!397061))

(declare-fun m!397063 () Bool)

(assert (=> b!266279 m!397063))

(declare-fun m!397065 () Bool)

(assert (=> b!266279 m!397065))

(declare-fun m!397067 () Bool)

(assert (=> b!266279 m!397067))

(declare-fun m!397069 () Bool)

(assert (=> start!58024 m!397069))

(declare-fun m!397071 () Bool)

(assert (=> start!58024 m!397071))

(declare-fun m!397073 () Bool)

(assert (=> start!58024 m!397073))

(assert (=> b!266283 m!397055))

(assert (=> b!266283 m!397055))

(declare-fun m!397075 () Bool)

(assert (=> b!266283 m!397075))

(declare-fun m!397077 () Bool)

(assert (=> b!266284 m!397077))

(push 1)


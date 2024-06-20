; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69622 () Bool)

(assert start!69622)

(declare-fun b!313210 () Bool)

(declare-fun e!225357 () Bool)

(declare-fun e!225356 () Bool)

(assert (=> b!313210 (= e!225357 e!225356)))

(declare-fun res!256422 () Bool)

(assert (=> b!313210 (=> (not res!256422) (not e!225356))))

(declare-fun lt!442150 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun lt!442151 () (_ BitVec 64))

(assert (=> b!313210 (= res!256422 (bvsge (bvsub lt!442151 lt!442150) b1ValidateOffsetBits!10))))

(declare-datatypes ((array!19222 0))(
  ( (array!19223 (arr!9418 (Array (_ BitVec 32) (_ BitVec 8))) (size!8338 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13780 0))(
  ( (BitStream!13781 (buf!7951 array!19222) (currentByte!14670 (_ BitVec 32)) (currentBit!14665 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13780)

(assert (=> b!313210 (= lt!442150 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14670 b1!97))) ((_ sign_extend 32) (currentBit!14665 b1!97))))))

(assert (=> b!313210 (= lt!442151 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8338 (buf!7951 b1!97)))))))

(declare-fun b!313211 () Bool)

(declare-fun e!225358 () Bool)

(assert (=> b!313211 (= e!225356 e!225358)))

(declare-fun res!256424 () Bool)

(assert (=> b!313211 (=> (not res!256424) (not e!225358))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun lt!442149 () (_ BitVec 64))

(assert (=> b!313211 (= res!256424 (and (bvsle lt!442149 (bvadd lt!442150 advancedAtMostBits!9)) (bvsge (bvsub lt!442151 lt!442149) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9))))))

(declare-fun b2!97 () BitStream!13780)

(assert (=> b!313211 (= lt!442149 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14670 b2!97))) ((_ sign_extend 32) (currentBit!14665 b2!97))))))

(declare-fun b!313212 () Bool)

(declare-fun e!225354 () Bool)

(declare-fun array_inv!7890 (array!19222) Bool)

(assert (=> b!313212 (= e!225354 (array_inv!7890 (buf!7951 b2!97)))))

(declare-fun b!313213 () Bool)

(declare-fun res!256423 () Bool)

(assert (=> b!313213 (=> (not res!256423) (not e!225357))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!313213 (= res!256423 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8338 (buf!7951 b1!97))) ((_ sign_extend 32) (currentByte!14670 b1!97)) ((_ sign_extend 32) (currentBit!14665 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!313214 () Bool)

(declare-fun e!225352 () Bool)

(assert (=> b!313214 (= e!225352 (array_inv!7890 (buf!7951 b1!97)))))

(declare-fun b!313215 () Bool)

(declare-fun res!256420 () Bool)

(assert (=> b!313215 (=> (not res!256420) (not e!225357))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!313215 (= res!256420 (validate_offset_bits!1 ((_ sign_extend 32) (size!8338 (buf!7951 b1!97))) ((_ sign_extend 32) (currentByte!14670 b1!97)) ((_ sign_extend 32) (currentBit!14665 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!256418 () Bool)

(assert (=> start!69622 (=> (not res!256418) (not e!225357))))

(assert (=> start!69622 (= res!256418 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8338 (buf!7951 b1!97)) (size!8338 (buf!7951 b2!97)))))))

(assert (=> start!69622 e!225357))

(assert (=> start!69622 true))

(declare-fun inv!12 (BitStream!13780) Bool)

(assert (=> start!69622 (and (inv!12 b1!97) e!225352)))

(assert (=> start!69622 (and (inv!12 b2!97) e!225354)))

(declare-fun b!313216 () Bool)

(assert (=> b!313216 (= e!225358 (and (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand advancedAtMostBits!9 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= (bvand b1ValidateOffsetBits!10 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!313217 () Bool)

(declare-fun res!256419 () Bool)

(assert (=> b!313217 (=> (not res!256419) (not e!225358))))

(assert (=> b!313217 (= res!256419 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8338 (buf!7951 b2!97))) ((_ sign_extend 32) (currentByte!14670 b2!97)) ((_ sign_extend 32) (currentBit!14665 b2!97))) (bvsub b1ValidateOffsetBits!10 advancedAtMostBits!9)))))

(declare-fun b!313218 () Bool)

(declare-fun res!256421 () Bool)

(assert (=> b!313218 (=> (not res!256421) (not e!225357))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!313218 (= res!256421 (bvsle (bitIndex!0 (size!8338 (buf!7951 b2!97)) (currentByte!14670 b2!97) (currentBit!14665 b2!97)) (bvadd (bitIndex!0 (size!8338 (buf!7951 b1!97)) (currentByte!14670 b1!97) (currentBit!14665 b1!97)) advancedAtMostBits!9)))))

(assert (= (and start!69622 res!256418) b!313215))

(assert (= (and b!313215 res!256420) b!313218))

(assert (= (and b!313218 res!256421) b!313213))

(assert (= (and b!313213 res!256423) b!313210))

(assert (= (and b!313210 res!256422) b!313211))

(assert (= (and b!313211 res!256424) b!313217))

(assert (= (and b!313217 res!256419) b!313216))

(assert (= start!69622 b!313214))

(assert (= start!69622 b!313212))

(declare-fun m!450785 () Bool)

(assert (=> b!313212 m!450785))

(declare-fun m!450787 () Bool)

(assert (=> b!313218 m!450787))

(declare-fun m!450789 () Bool)

(assert (=> b!313218 m!450789))

(declare-fun m!450791 () Bool)

(assert (=> start!69622 m!450791))

(declare-fun m!450793 () Bool)

(assert (=> start!69622 m!450793))

(declare-fun m!450795 () Bool)

(assert (=> b!313214 m!450795))

(declare-fun m!450797 () Bool)

(assert (=> b!313213 m!450797))

(declare-fun m!450799 () Bool)

(assert (=> b!313217 m!450799))

(declare-fun m!450801 () Bool)

(assert (=> b!313215 m!450801))

(push 1)

(assert (not b!313217))

(assert (not b!313215))

(assert (not b!313218))

(assert (not b!313214))

(assert (not start!69622))

(assert (not b!313213))

(assert (not b!313212))

(check-sat)

(pop 1)

(push 1)

(check-sat)


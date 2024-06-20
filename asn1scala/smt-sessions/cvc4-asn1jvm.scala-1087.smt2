; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31292 () Bool)

(assert start!31292)

(declare-fun res!131519 () Bool)

(declare-fun e!106610 () Bool)

(assert (=> start!31292 (=> (not res!131519) (not e!106610))))

(declare-fun from!240 () (_ BitVec 32))

(declare-fun to!236 () (_ BitVec 32))

(declare-datatypes ((array!7264 0))(
  ( (array!7265 (arr!4177 (Array (_ BitVec 32) (_ BitVec 8))) (size!3288 (_ BitVec 32))) )
))
(declare-fun arr!153 () array!7264)

(assert (=> start!31292 (= res!131519 (and (bvsle #b00000000000000000000000000000000 from!240) (bvslt from!240 to!236) (bvsle to!236 (size!3288 arr!153))))))

(assert (=> start!31292 e!106610))

(assert (=> start!31292 true))

(declare-fun array_inv!3047 (array!7264) Bool)

(assert (=> start!31292 (array_inv!3047 arr!153)))

(declare-datatypes ((BitStream!5768 0))(
  ( (BitStream!5769 (buf!3758 array!7264) (currentByte!6903 (_ BitVec 32)) (currentBit!6898 (_ BitVec 32))) )
))
(declare-fun bs!65 () BitStream!5768)

(declare-fun e!106608 () Bool)

(declare-fun inv!12 (BitStream!5768) Bool)

(assert (=> start!31292 (and (inv!12 bs!65) e!106608)))

(declare-fun b!157385 () Bool)

(declare-fun res!131518 () Bool)

(assert (=> b!157385 (=> (not res!131518) (not e!106610))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!157385 (= res!131518 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3288 (buf!3758 bs!65))) ((_ sign_extend 32) (currentByte!6903 bs!65)) ((_ sign_extend 32) (currentBit!6898 bs!65)) (bvsub to!236 from!240)))))

(declare-fun b!157386 () Bool)

(assert (=> b!157386 (= e!106610 (and (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand from!240 #b10000000000000000000000000000000))) (not (= (bvand to!236 #b10000000000000000000000000000000) (bvand (bvsub to!236 from!240) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!14196 0))(
  ( (tuple2!14197 (_1!7548 BitStream!5768) (_2!7548 array!7264)) )
))
(declare-fun lt!247288 () tuple2!14196)

(declare-fun readByteArrayLoopPure!0 (BitStream!5768 array!7264 (_ BitVec 32) (_ BitVec 32)) tuple2!14196)

(declare-fun withMovedByteIndex!0 (BitStream!5768 (_ BitVec 32)) BitStream!5768)

(declare-datatypes ((tuple2!14198 0))(
  ( (tuple2!14199 (_1!7549 BitStream!5768) (_2!7549 (_ BitVec 8))) )
))
(declare-fun readBytePure!0 (BitStream!5768) tuple2!14198)

(assert (=> b!157386 (= lt!247288 (readByteArrayLoopPure!0 (withMovedByteIndex!0 bs!65 #b00000000000000000000000000000001) (array!7265 (store (arr!4177 arr!153) from!240 (_2!7549 (readBytePure!0 bs!65))) (size!3288 arr!153)) (bvadd #b00000000000000000000000000000001 from!240) to!236))))

(declare-fun lt!247287 () tuple2!14196)

(assert (=> b!157386 (= lt!247287 (readByteArrayLoopPure!0 bs!65 arr!153 from!240 to!236))))

(declare-fun b!157387 () Bool)

(assert (=> b!157387 (= e!106608 (array_inv!3047 (buf!3758 bs!65)))))

(assert (= (and start!31292 res!131519) b!157385))

(assert (= (and b!157385 res!131518) b!157386))

(assert (= start!31292 b!157387))

(declare-fun m!246243 () Bool)

(assert (=> start!31292 m!246243))

(declare-fun m!246245 () Bool)

(assert (=> start!31292 m!246245))

(declare-fun m!246247 () Bool)

(assert (=> b!157385 m!246247))

(declare-fun m!246249 () Bool)

(assert (=> b!157386 m!246249))

(declare-fun m!246251 () Bool)

(assert (=> b!157386 m!246251))

(assert (=> b!157386 m!246251))

(declare-fun m!246253 () Bool)

(assert (=> b!157386 m!246253))

(declare-fun m!246255 () Bool)

(assert (=> b!157386 m!246255))

(declare-fun m!246257 () Bool)

(assert (=> b!157386 m!246257))

(declare-fun m!246259 () Bool)

(assert (=> b!157387 m!246259))

(push 1)

(assert (not b!157385))

(assert (not b!157387))

(assert (not b!157386))

(assert (not start!31292))

(check-sat)

(pop 1)

(push 1)

(check-sat)


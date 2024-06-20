; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48946 () Bool)

(assert start!48946)

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun lt!368805 () (_ BitVec 64))

(declare-fun lt!368804 () (_ BitVec 64))

(declare-datatypes ((array!11915 0))(
  ( (array!11916 (arr!6210 (Array (_ BitVec 32) (_ BitVec 8))) (size!5223 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9542 0))(
  ( (BitStream!9543 (buf!5764 array!11915) (currentByte!10771 (_ BitVec 32)) (currentBit!10766 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9542)

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9542)

(declare-fun b!231923 () Bool)

(declare-fun e!159575 () Bool)

(assert (=> b!231923 (= e!159575 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5223 (buf!5764 b1!101)))) lt!368804) #b0000000000000000000000000000000000000000000000000000000000001000)) (= lt!368805 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10771 b2!99))) ((_ sign_extend 32) (currentBit!10766 b2!99)))) (= (bvsub lt!368805 bits!86) lt!368804) (not (= ((_ sign_extend 32) (size!5223 (buf!5764 b2!99))) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5223 (buf!5764 b2!99)))) ((_ sign_extend 32) (size!5223 (buf!5764 b2!99))))))))))

(assert (=> b!231923 (= lt!368804 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10771 b1!101))) ((_ sign_extend 32) (currentBit!10766 b1!101))))))

(declare-fun b!231924 () Bool)

(declare-fun e!159573 () Bool)

(declare-fun array_inv!4964 (array!11915) Bool)

(assert (=> b!231924 (= e!159573 (array_inv!4964 (buf!5764 b1!101)))))

(declare-fun res!194198 () Bool)

(declare-fun e!159571 () Bool)

(assert (=> start!48946 (=> (not res!194198) (not e!159571))))

(assert (=> start!48946 (= res!194198 (and (= (size!5223 (buf!5764 b1!101)) (size!5223 (buf!5764 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48946 e!159571))

(declare-fun inv!12 (BitStream!9542) Bool)

(assert (=> start!48946 (and (inv!12 b1!101) e!159573)))

(declare-fun e!159572 () Bool)

(assert (=> start!48946 (and (inv!12 b2!99) e!159572)))

(assert (=> start!48946 true))

(declare-fun b!231925 () Bool)

(declare-fun res!194196 () Bool)

(assert (=> b!231925 (=> (not res!194196) (not e!159575))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!231925 (= res!194196 (= lt!368805 (bvadd (bitIndex!0 (size!5223 (buf!5764 b1!101)) (currentByte!10771 b1!101) (currentBit!10766 b1!101)) bits!86)))))

(declare-fun b!231926 () Bool)

(declare-fun res!194197 () Bool)

(assert (=> b!231926 (=> (not res!194197) (not e!159575))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!231926 (= res!194197 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5223 (buf!5764 b1!101))) ((_ sign_extend 32) (currentByte!10771 b1!101)) ((_ sign_extend 32) (currentBit!10766 b1!101)) bytes!19))))

(declare-fun b!231927 () Bool)

(assert (=> b!231927 (= e!159572 (array_inv!4964 (buf!5764 b2!99)))))

(declare-fun b!231928 () Bool)

(assert (=> b!231928 (= e!159571 e!159575)))

(declare-fun res!194195 () Bool)

(assert (=> b!231928 (=> (not res!194195) (not e!159575))))

(assert (=> b!231928 (= res!194195 (and (bvsle bits!86 lt!368805) (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19)))))

(assert (=> b!231928 (= lt!368805 (bitIndex!0 (size!5223 (buf!5764 b2!99)) (currentByte!10771 b2!99) (currentBit!10766 b2!99)))))

(declare-fun b!231929 () Bool)

(declare-fun res!194199 () Bool)

(assert (=> b!231929 (=> (not res!194199) (not e!159575))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!231929 (= res!194199 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5223 (buf!5764 b1!101))) ((_ sign_extend 32) (currentByte!10771 b1!101)) ((_ sign_extend 32) (currentBit!10766 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (= (and start!48946 res!194198) b!231928))

(assert (= (and b!231928 res!194195) b!231926))

(assert (= (and b!231926 res!194197) b!231925))

(assert (= (and b!231925 res!194196) b!231929))

(assert (= (and b!231929 res!194199) b!231923))

(assert (= start!48946 b!231924))

(assert (= start!48946 b!231927))

(declare-fun m!354931 () Bool)

(assert (=> b!231927 m!354931))

(declare-fun m!354933 () Bool)

(assert (=> b!231929 m!354933))

(declare-fun m!354935 () Bool)

(assert (=> b!231924 m!354935))

(declare-fun m!354937 () Bool)

(assert (=> b!231928 m!354937))

(declare-fun m!354939 () Bool)

(assert (=> start!48946 m!354939))

(declare-fun m!354941 () Bool)

(assert (=> start!48946 m!354941))

(declare-fun m!354943 () Bool)

(assert (=> b!231926 m!354943))

(declare-fun m!354945 () Bool)

(assert (=> b!231925 m!354945))

(push 1)

(assert (not start!48946))

(assert (not b!231925))

(assert (not b!231928))

(assert (not b!231924))

(assert (not b!231927))

(assert (not b!231926))

(assert (not b!231929))

(check-sat)

(pop 1)

(push 1)

(check-sat)


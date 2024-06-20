; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25440 () Bool)

(assert start!25440)

(declare-datatypes ((array!5925 0))(
  ( (array!5926 (arr!3295 (Array (_ BitVec 32) (_ BitVec 8))) (size!2678 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4620 0))(
  ( (BitStream!4621 (buf!3036 array!5925) (currentByte!5797 (_ BitVec 32)) (currentBit!5792 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10834 0))(
  ( (tuple2!10835 (_1!5714 BitStream!4620) (_2!5714 (_ BitVec 8))) )
))
(declare-fun lt!199412 () tuple2!10834)

(declare-fun b!128376 () Bool)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!10836 0))(
  ( (tuple2!10837 (_1!5715 BitStream!4620) (_2!5715 BitStream!4620)) )
))
(declare-fun lt!199410 () tuple2!10836)

(declare-fun e!85102 () Bool)

(declare-fun arr!237 () array!5925)

(assert (=> b!128376 (= e!85102 (and (= (_2!5714 lt!199412) (select (arr!3295 arr!237) from!447)) (= (_1!5714 lt!199412) (_2!5715 lt!199410))))))

(declare-fun readBytePure!0 (BitStream!4620) tuple2!10834)

(assert (=> b!128376 (= lt!199412 (readBytePure!0 (_1!5715 lt!199410)))))

(declare-fun thiss!1634 () BitStream!4620)

(declare-datatypes ((Unit!7961 0))(
  ( (Unit!7962) )
))
(declare-datatypes ((tuple2!10838 0))(
  ( (tuple2!10839 (_1!5716 Unit!7961) (_2!5716 BitStream!4620)) )
))
(declare-fun lt!199411 () tuple2!10838)

(declare-fun reader!0 (BitStream!4620 BitStream!4620) tuple2!10836)

(assert (=> b!128376 (= lt!199410 (reader!0 thiss!1634 (_2!5716 lt!199411)))))

(declare-fun b!128377 () Bool)

(declare-fun e!85100 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128377 (= e!85100 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!5792 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!5797 thiss!1634))) ((_ extract 31 0) ((_ sign_extend 32) (size!2678 (buf!3036 thiss!1634))))))))

(declare-fun b!128378 () Bool)

(declare-fun e!85098 () Bool)

(assert (=> b!128378 (= e!85098 (not e!85100))))

(declare-fun res!106240 () Bool)

(assert (=> b!128378 (=> res!106240 e!85100)))

(assert (=> b!128378 (= res!106240 (or (bvsgt ((_ sign_extend 32) (size!2678 (buf!3036 thiss!1634))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!5797 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!5792 thiss!1634)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!2678 (buf!3036 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!5797 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!5792 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!128378 e!85102))

(declare-fun res!106245 () Bool)

(assert (=> b!128378 (=> (not res!106245) (not e!85102))))

(assert (=> b!128378 (= res!106245 (= (size!2678 (buf!3036 thiss!1634)) (size!2678 (buf!3036 (_2!5716 lt!199411)))))))

(declare-fun appendByte!0 (BitStream!4620 (_ BitVec 8)) tuple2!10838)

(assert (=> b!128378 (= lt!199411 (appendByte!0 thiss!1634 (select (arr!3295 arr!237) from!447)))))

(declare-fun b!128379 () Bool)

(declare-fun e!85103 () Bool)

(declare-fun array_inv!2467 (array!5925) Bool)

(assert (=> b!128379 (= e!85103 (array_inv!2467 (buf!3036 thiss!1634)))))

(declare-fun b!128380 () Bool)

(declare-fun res!106239 () Bool)

(assert (=> b!128380 (=> (not res!106239) (not e!85102))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128380 (= res!106239 (= (bitIndex!0 (size!2678 (buf!3036 (_2!5716 lt!199411))) (currentByte!5797 (_2!5716 lt!199411)) (currentBit!5792 (_2!5716 lt!199411))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2678 (buf!3036 thiss!1634)) (currentByte!5797 thiss!1634) (currentBit!5792 thiss!1634)))))))

(declare-fun b!128381 () Bool)

(declare-fun res!106241 () Bool)

(assert (=> b!128381 (=> (not res!106241) (not e!85098))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128381 (= res!106241 (bvslt from!447 to!404))))

(declare-fun b!128383 () Bool)

(declare-fun res!106242 () Bool)

(assert (=> b!128383 (=> (not res!106242) (not e!85102))))

(declare-fun isPrefixOf!0 (BitStream!4620 BitStream!4620) Bool)

(assert (=> b!128383 (= res!106242 (isPrefixOf!0 thiss!1634 (_2!5716 lt!199411)))))

(declare-fun b!128384 () Bool)

(declare-fun res!106243 () Bool)

(assert (=> b!128384 (=> (not res!106243) (not e!85098))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128384 (= res!106243 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2678 (buf!3036 thiss!1634))) ((_ sign_extend 32) (currentByte!5797 thiss!1634)) ((_ sign_extend 32) (currentBit!5792 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128382 () Bool)

(declare-fun res!106246 () Bool)

(assert (=> b!128382 (=> (not res!106246) (not e!85098))))

(assert (=> b!128382 (= res!106246 (invariant!0 (currentBit!5792 thiss!1634) (currentByte!5797 thiss!1634) (size!2678 (buf!3036 thiss!1634))))))

(declare-fun res!106244 () Bool)

(assert (=> start!25440 (=> (not res!106244) (not e!85098))))

(assert (=> start!25440 (= res!106244 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2678 arr!237))))))

(assert (=> start!25440 e!85098))

(assert (=> start!25440 true))

(assert (=> start!25440 (array_inv!2467 arr!237)))

(declare-fun inv!12 (BitStream!4620) Bool)

(assert (=> start!25440 (and (inv!12 thiss!1634) e!85103)))

(assert (= (and start!25440 res!106244) b!128384))

(assert (= (and b!128384 res!106243) b!128381))

(assert (= (and b!128381 res!106241) b!128382))

(assert (= (and b!128382 res!106246) b!128378))

(assert (= (and b!128378 res!106245) b!128380))

(assert (= (and b!128380 res!106239) b!128383))

(assert (= (and b!128383 res!106242) b!128376))

(assert (= (and b!128378 (not res!106240)) b!128377))

(assert (= start!25440 b!128379))

(declare-fun m!194169 () Bool)

(assert (=> b!128376 m!194169))

(declare-fun m!194171 () Bool)

(assert (=> b!128376 m!194171))

(declare-fun m!194173 () Bool)

(assert (=> b!128376 m!194173))

(declare-fun m!194175 () Bool)

(assert (=> b!128379 m!194175))

(assert (=> b!128378 m!194169))

(assert (=> b!128378 m!194169))

(declare-fun m!194177 () Bool)

(assert (=> b!128378 m!194177))

(declare-fun m!194179 () Bool)

(assert (=> b!128377 m!194179))

(declare-fun m!194181 () Bool)

(assert (=> b!128384 m!194181))

(declare-fun m!194183 () Bool)

(assert (=> b!128382 m!194183))

(declare-fun m!194185 () Bool)

(assert (=> start!25440 m!194185))

(declare-fun m!194187 () Bool)

(assert (=> start!25440 m!194187))

(declare-fun m!194189 () Bool)

(assert (=> b!128380 m!194189))

(declare-fun m!194191 () Bool)

(assert (=> b!128380 m!194191))

(declare-fun m!194193 () Bool)

(assert (=> b!128383 m!194193))

(check-sat (not b!128380) (not b!128376) (not b!128384) (not b!128377) (not b!128383) (not b!128378) (not b!128382) (not b!128379) (not start!25440))

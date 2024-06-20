; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2920 () Bool)

(assert start!2920)

(declare-fun b!13528 () Bool)

(declare-fun e!8300 () Bool)

(declare-datatypes ((array!761 0))(
  ( (array!762 (arr!758 (Array (_ BitVec 32) (_ BitVec 8))) (size!329 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!618 0))(
  ( (BitStream!619 (buf!680 array!761) (currentByte!1788 (_ BitVec 32)) (currentBit!1783 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!1602 0))(
  ( (tuple2!1603 (_1!856 BitStream!618) (_2!856 Bool)) )
))
(declare-fun lt!21200 () tuple2!1602)

(declare-fun lt!21198 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13528 (= e!8300 (= (bitIndex!0 (size!329 (buf!680 (_1!856 lt!21200))) (currentByte!1788 (_1!856 lt!21200)) (currentBit!1783 (_1!856 lt!21200))) lt!21198))))

(declare-fun b!13529 () Bool)

(declare-fun e!8303 () Bool)

(declare-datatypes ((Unit!1123 0))(
  ( (Unit!1124) )
))
(declare-datatypes ((tuple2!1604 0))(
  ( (tuple2!1605 (_1!857 Unit!1123) (_2!857 BitStream!618)) )
))
(declare-fun lt!21197 () tuple2!1604)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13529 (= e!8303 (invariant!0 (currentBit!1783 (_2!857 lt!21197)) (currentByte!1788 (_2!857 lt!21197)) (size!329 (buf!680 (_2!857 lt!21197)))))))

(declare-fun b!13530 () Bool)

(declare-fun res!12836 () Bool)

(declare-fun e!8304 () Bool)

(assert (=> b!13530 (=> (not res!12836) (not e!8304))))

(declare-fun thiss!957 () BitStream!618)

(declare-fun isPrefixOf!0 (BitStream!618 BitStream!618) Bool)

(assert (=> b!13530 (= res!12836 (isPrefixOf!0 thiss!957 (_2!857 lt!21197)))))

(declare-fun b!13531 () Bool)

(declare-fun e!8302 () Bool)

(assert (=> b!13531 (= e!8302 e!8304)))

(declare-fun res!12834 () Bool)

(assert (=> b!13531 (=> (not res!12834) (not e!8304))))

(declare-fun lt!21199 () (_ BitVec 64))

(assert (=> b!13531 (= res!12834 (= lt!21198 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21199)))))

(assert (=> b!13531 (= lt!21198 (bitIndex!0 (size!329 (buf!680 (_2!857 lt!21197))) (currentByte!1788 (_2!857 lt!21197)) (currentBit!1783 (_2!857 lt!21197))))))

(assert (=> b!13531 (= lt!21199 (bitIndex!0 (size!329 (buf!680 thiss!957)) (currentByte!1788 thiss!957) (currentBit!1783 thiss!957)))))

(declare-fun b!13532 () Bool)

(declare-fun res!12833 () Bool)

(assert (=> b!13532 (=> res!12833 e!8303)))

(assert (=> b!13532 (= res!12833 (not (= (bitIndex!0 (size!329 (buf!680 (_2!857 lt!21197))) (currentByte!1788 (_2!857 lt!21197)) (currentBit!1783 (_2!857 lt!21197))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!329 (buf!680 thiss!957)) (currentByte!1788 thiss!957) (currentBit!1783 thiss!957))))))))

(declare-fun b!13533 () Bool)

(declare-fun res!12835 () Bool)

(assert (=> b!13533 (=> res!12835 e!8303)))

(assert (=> b!13533 (= res!12835 (not (isPrefixOf!0 thiss!957 (_2!857 lt!21197))))))

(declare-fun res!12838 () Bool)

(declare-fun e!8306 () Bool)

(assert (=> start!2920 (=> (not res!12838) (not e!8306))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2920 (= res!12838 (validate_offset_bit!0 ((_ sign_extend 32) (size!329 (buf!680 thiss!957))) ((_ sign_extend 32) (currentByte!1788 thiss!957)) ((_ sign_extend 32) (currentBit!1783 thiss!957))))))

(assert (=> start!2920 e!8306))

(declare-fun e!8301 () Bool)

(declare-fun inv!12 (BitStream!618) Bool)

(assert (=> start!2920 (and (inv!12 thiss!957) e!8301)))

(declare-fun b!13534 () Bool)

(assert (=> b!13534 (= e!8306 (not e!8303))))

(declare-fun res!12831 () Bool)

(assert (=> b!13534 (=> res!12831 e!8303)))

(assert (=> b!13534 (= res!12831 (not (= (size!329 (buf!680 (_2!857 lt!21197))) (size!329 (buf!680 thiss!957)))))))

(assert (=> b!13534 e!8302))

(declare-fun res!12832 () Bool)

(assert (=> b!13534 (=> (not res!12832) (not e!8302))))

(assert (=> b!13534 (= res!12832 (= (size!329 (buf!680 thiss!957)) (size!329 (buf!680 (_2!857 lt!21197)))))))

(declare-fun appendBit!0 (BitStream!618 Bool) tuple2!1604)

(assert (=> b!13534 (= lt!21197 (appendBit!0 thiss!957 false))))

(declare-fun b!13535 () Bool)

(assert (=> b!13535 (= e!8304 e!8300)))

(declare-fun res!12837 () Bool)

(assert (=> b!13535 (=> (not res!12837) (not e!8300))))

(assert (=> b!13535 (= res!12837 (and (not (_2!856 lt!21200)) (= (_1!856 lt!21200) (_2!857 lt!21197))))))

(declare-fun readBitPure!0 (BitStream!618) tuple2!1602)

(declare-fun readerFrom!0 (BitStream!618 (_ BitVec 32) (_ BitVec 32)) BitStream!618)

(assert (=> b!13535 (= lt!21200 (readBitPure!0 (readerFrom!0 (_2!857 lt!21197) (currentBit!1783 thiss!957) (currentByte!1788 thiss!957))))))

(declare-fun b!13536 () Bool)

(declare-fun array_inv!318 (array!761) Bool)

(assert (=> b!13536 (= e!8301 (array_inv!318 (buf!680 thiss!957)))))

(assert (= (and start!2920 res!12838) b!13534))

(assert (= (and b!13534 res!12832) b!13531))

(assert (= (and b!13531 res!12834) b!13530))

(assert (= (and b!13530 res!12836) b!13535))

(assert (= (and b!13535 res!12837) b!13528))

(assert (= (and b!13534 (not res!12831)) b!13532))

(assert (= (and b!13532 (not res!12833)) b!13533))

(assert (= (and b!13533 (not res!12835)) b!13529))

(assert (= start!2920 b!13536))

(declare-fun m!20137 () Bool)

(assert (=> b!13534 m!20137))

(declare-fun m!20139 () Bool)

(assert (=> b!13530 m!20139))

(declare-fun m!20141 () Bool)

(assert (=> b!13532 m!20141))

(declare-fun m!20143 () Bool)

(assert (=> b!13532 m!20143))

(declare-fun m!20145 () Bool)

(assert (=> b!13529 m!20145))

(declare-fun m!20147 () Bool)

(assert (=> start!2920 m!20147))

(declare-fun m!20149 () Bool)

(assert (=> start!2920 m!20149))

(declare-fun m!20151 () Bool)

(assert (=> b!13535 m!20151))

(assert (=> b!13535 m!20151))

(declare-fun m!20153 () Bool)

(assert (=> b!13535 m!20153))

(declare-fun m!20155 () Bool)

(assert (=> b!13536 m!20155))

(assert (=> b!13533 m!20139))

(declare-fun m!20157 () Bool)

(assert (=> b!13528 m!20157))

(assert (=> b!13531 m!20141))

(assert (=> b!13531 m!20143))

(check-sat (not b!13533) (not b!13532) (not start!2920) (not b!13528) (not b!13530) (not b!13535) (not b!13536) (not b!13531) (not b!13529) (not b!13534))
(check-sat)
(get-model)

(declare-fun d!4364 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4364 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!329 (buf!680 thiss!957))) ((_ sign_extend 32) (currentByte!1788 thiss!957)) ((_ sign_extend 32) (currentBit!1783 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!329 (buf!680 thiss!957))) ((_ sign_extend 32) (currentByte!1788 thiss!957)) ((_ sign_extend 32) (currentBit!1783 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1216 () Bool)

(assert (= bs!1216 d!4364))

(declare-fun m!20181 () Bool)

(assert (=> bs!1216 m!20181))

(assert (=> start!2920 d!4364))

(declare-fun d!4366 () Bool)

(assert (=> d!4366 (= (inv!12 thiss!957) (invariant!0 (currentBit!1783 thiss!957) (currentByte!1788 thiss!957) (size!329 (buf!680 thiss!957))))))

(declare-fun bs!1217 () Bool)

(assert (= bs!1217 d!4366))

(declare-fun m!20183 () Bool)

(assert (=> bs!1217 m!20183))

(assert (=> start!2920 d!4366))

(declare-fun d!4370 () Bool)

(declare-fun e!8330 () Bool)

(assert (=> d!4370 e!8330))

(declare-fun res!12868 () Bool)

(assert (=> d!4370 (=> (not res!12868) (not e!8330))))

(declare-fun lt!21225 () (_ BitVec 64))

(declare-fun lt!21230 () (_ BitVec 64))

(declare-fun lt!21226 () (_ BitVec 64))

(assert (=> d!4370 (= res!12868 (= lt!21226 (bvsub lt!21225 lt!21230)))))

(assert (=> d!4370 (or (= (bvand lt!21225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21230 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21225 lt!21230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4370 (= lt!21230 (remainingBits!0 ((_ sign_extend 32) (size!329 (buf!680 (_2!857 lt!21197)))) ((_ sign_extend 32) (currentByte!1788 (_2!857 lt!21197))) ((_ sign_extend 32) (currentBit!1783 (_2!857 lt!21197)))))))

(declare-fun lt!21228 () (_ BitVec 64))

(declare-fun lt!21229 () (_ BitVec 64))

(assert (=> d!4370 (= lt!21225 (bvmul lt!21228 lt!21229))))

(assert (=> d!4370 (or (= lt!21228 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21229 (bvsdiv (bvmul lt!21228 lt!21229) lt!21228)))))

(assert (=> d!4370 (= lt!21229 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4370 (= lt!21228 ((_ sign_extend 32) (size!329 (buf!680 (_2!857 lt!21197)))))))

(assert (=> d!4370 (= lt!21226 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1788 (_2!857 lt!21197))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1783 (_2!857 lt!21197)))))))

(assert (=> d!4370 (invariant!0 (currentBit!1783 (_2!857 lt!21197)) (currentByte!1788 (_2!857 lt!21197)) (size!329 (buf!680 (_2!857 lt!21197))))))

(assert (=> d!4370 (= (bitIndex!0 (size!329 (buf!680 (_2!857 lt!21197))) (currentByte!1788 (_2!857 lt!21197)) (currentBit!1783 (_2!857 lt!21197))) lt!21226)))

(declare-fun b!13568 () Bool)

(declare-fun res!12867 () Bool)

(assert (=> b!13568 (=> (not res!12867) (not e!8330))))

(assert (=> b!13568 (= res!12867 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21226))))

(declare-fun b!13569 () Bool)

(declare-fun lt!21227 () (_ BitVec 64))

(assert (=> b!13569 (= e!8330 (bvsle lt!21226 (bvmul lt!21227 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13569 (or (= lt!21227 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21227 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21227)))))

(assert (=> b!13569 (= lt!21227 ((_ sign_extend 32) (size!329 (buf!680 (_2!857 lt!21197)))))))

(assert (= (and d!4370 res!12868) b!13568))

(assert (= (and b!13568 res!12867) b!13569))

(declare-fun m!20193 () Bool)

(assert (=> d!4370 m!20193))

(assert (=> d!4370 m!20145))

(assert (=> b!13532 d!4370))

(declare-fun d!4382 () Bool)

(declare-fun e!8331 () Bool)

(assert (=> d!4382 e!8331))

(declare-fun res!12870 () Bool)

(assert (=> d!4382 (=> (not res!12870) (not e!8331))))

(declare-fun lt!21232 () (_ BitVec 64))

(declare-fun lt!21236 () (_ BitVec 64))

(declare-fun lt!21231 () (_ BitVec 64))

(assert (=> d!4382 (= res!12870 (= lt!21232 (bvsub lt!21231 lt!21236)))))

(assert (=> d!4382 (or (= (bvand lt!21231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21236 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21231 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21231 lt!21236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4382 (= lt!21236 (remainingBits!0 ((_ sign_extend 32) (size!329 (buf!680 thiss!957))) ((_ sign_extend 32) (currentByte!1788 thiss!957)) ((_ sign_extend 32) (currentBit!1783 thiss!957))))))

(declare-fun lt!21234 () (_ BitVec 64))

(declare-fun lt!21235 () (_ BitVec 64))

(assert (=> d!4382 (= lt!21231 (bvmul lt!21234 lt!21235))))

(assert (=> d!4382 (or (= lt!21234 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21235 (bvsdiv (bvmul lt!21234 lt!21235) lt!21234)))))

(assert (=> d!4382 (= lt!21235 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4382 (= lt!21234 ((_ sign_extend 32) (size!329 (buf!680 thiss!957))))))

(assert (=> d!4382 (= lt!21232 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1788 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1783 thiss!957))))))

(assert (=> d!4382 (invariant!0 (currentBit!1783 thiss!957) (currentByte!1788 thiss!957) (size!329 (buf!680 thiss!957)))))

(assert (=> d!4382 (= (bitIndex!0 (size!329 (buf!680 thiss!957)) (currentByte!1788 thiss!957) (currentBit!1783 thiss!957)) lt!21232)))

(declare-fun b!13570 () Bool)

(declare-fun res!12869 () Bool)

(assert (=> b!13570 (=> (not res!12869) (not e!8331))))

(assert (=> b!13570 (= res!12869 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21232))))

(declare-fun b!13571 () Bool)

(declare-fun lt!21233 () (_ BitVec 64))

(assert (=> b!13571 (= e!8331 (bvsle lt!21232 (bvmul lt!21233 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13571 (or (= lt!21233 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21233 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21233)))))

(assert (=> b!13571 (= lt!21233 ((_ sign_extend 32) (size!329 (buf!680 thiss!957))))))

(assert (= (and d!4382 res!12870) b!13570))

(assert (= (and b!13570 res!12869) b!13571))

(assert (=> d!4382 m!20181))

(assert (=> d!4382 m!20183))

(assert (=> b!13532 d!4382))

(declare-fun d!4384 () Bool)

(declare-fun res!12879 () Bool)

(declare-fun e!8337 () Bool)

(assert (=> d!4384 (=> (not res!12879) (not e!8337))))

(assert (=> d!4384 (= res!12879 (= (size!329 (buf!680 thiss!957)) (size!329 (buf!680 (_2!857 lt!21197)))))))

(assert (=> d!4384 (= (isPrefixOf!0 thiss!957 (_2!857 lt!21197)) e!8337)))

(declare-fun b!13578 () Bool)

(declare-fun res!12877 () Bool)

(assert (=> b!13578 (=> (not res!12877) (not e!8337))))

(assert (=> b!13578 (= res!12877 (bvsle (bitIndex!0 (size!329 (buf!680 thiss!957)) (currentByte!1788 thiss!957) (currentBit!1783 thiss!957)) (bitIndex!0 (size!329 (buf!680 (_2!857 lt!21197))) (currentByte!1788 (_2!857 lt!21197)) (currentBit!1783 (_2!857 lt!21197)))))))

(declare-fun b!13579 () Bool)

(declare-fun e!8336 () Bool)

(assert (=> b!13579 (= e!8337 e!8336)))

(declare-fun res!12878 () Bool)

(assert (=> b!13579 (=> res!12878 e!8336)))

(assert (=> b!13579 (= res!12878 (= (size!329 (buf!680 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13580 () Bool)

(declare-fun arrayBitRangesEq!0 (array!761 array!761 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13580 (= e!8336 (arrayBitRangesEq!0 (buf!680 thiss!957) (buf!680 (_2!857 lt!21197)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!329 (buf!680 thiss!957)) (currentByte!1788 thiss!957) (currentBit!1783 thiss!957))))))

(assert (= (and d!4384 res!12879) b!13578))

(assert (= (and b!13578 res!12877) b!13579))

(assert (= (and b!13579 (not res!12878)) b!13580))

(assert (=> b!13578 m!20143))

(assert (=> b!13578 m!20141))

(assert (=> b!13580 m!20143))

(assert (=> b!13580 m!20143))

(declare-fun m!20195 () Bool)

(assert (=> b!13580 m!20195))

(assert (=> b!13533 d!4384))

(declare-fun d!4386 () Bool)

(declare-fun e!8338 () Bool)

(assert (=> d!4386 e!8338))

(declare-fun res!12881 () Bool)

(assert (=> d!4386 (=> (not res!12881) (not e!8338))))

(declare-fun lt!21238 () (_ BitVec 64))

(declare-fun lt!21237 () (_ BitVec 64))

(declare-fun lt!21242 () (_ BitVec 64))

(assert (=> d!4386 (= res!12881 (= lt!21238 (bvsub lt!21237 lt!21242)))))

(assert (=> d!4386 (or (= (bvand lt!21237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21242 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21237 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21237 lt!21242) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4386 (= lt!21242 (remainingBits!0 ((_ sign_extend 32) (size!329 (buf!680 (_1!856 lt!21200)))) ((_ sign_extend 32) (currentByte!1788 (_1!856 lt!21200))) ((_ sign_extend 32) (currentBit!1783 (_1!856 lt!21200)))))))

(declare-fun lt!21240 () (_ BitVec 64))

(declare-fun lt!21241 () (_ BitVec 64))

(assert (=> d!4386 (= lt!21237 (bvmul lt!21240 lt!21241))))

(assert (=> d!4386 (or (= lt!21240 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21241 (bvsdiv (bvmul lt!21240 lt!21241) lt!21240)))))

(assert (=> d!4386 (= lt!21241 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4386 (= lt!21240 ((_ sign_extend 32) (size!329 (buf!680 (_1!856 lt!21200)))))))

(assert (=> d!4386 (= lt!21238 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1788 (_1!856 lt!21200))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1783 (_1!856 lt!21200)))))))

(assert (=> d!4386 (invariant!0 (currentBit!1783 (_1!856 lt!21200)) (currentByte!1788 (_1!856 lt!21200)) (size!329 (buf!680 (_1!856 lt!21200))))))

(assert (=> d!4386 (= (bitIndex!0 (size!329 (buf!680 (_1!856 lt!21200))) (currentByte!1788 (_1!856 lt!21200)) (currentBit!1783 (_1!856 lt!21200))) lt!21238)))

(declare-fun b!13581 () Bool)

(declare-fun res!12880 () Bool)

(assert (=> b!13581 (=> (not res!12880) (not e!8338))))

(assert (=> b!13581 (= res!12880 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21238))))

(declare-fun b!13582 () Bool)

(declare-fun lt!21239 () (_ BitVec 64))

(assert (=> b!13582 (= e!8338 (bvsle lt!21238 (bvmul lt!21239 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13582 (or (= lt!21239 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21239 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21239)))))

(assert (=> b!13582 (= lt!21239 ((_ sign_extend 32) (size!329 (buf!680 (_1!856 lt!21200)))))))

(assert (= (and d!4386 res!12881) b!13581))

(assert (= (and b!13581 res!12880) b!13582))

(declare-fun m!20197 () Bool)

(assert (=> d!4386 m!20197))

(declare-fun m!20199 () Bool)

(assert (=> d!4386 m!20199))

(assert (=> b!13528 d!4386))

(declare-fun b!13624 () Bool)

(declare-fun e!8359 () Bool)

(declare-fun lt!21279 () tuple2!1602)

(declare-fun lt!21280 () tuple2!1604)

(assert (=> b!13624 (= e!8359 (= (bitIndex!0 (size!329 (buf!680 (_1!856 lt!21279))) (currentByte!1788 (_1!856 lt!21279)) (currentBit!1783 (_1!856 lt!21279))) (bitIndex!0 (size!329 (buf!680 (_2!857 lt!21280))) (currentByte!1788 (_2!857 lt!21280)) (currentBit!1783 (_2!857 lt!21280)))))))

(declare-fun b!13623 () Bool)

(declare-fun e!8358 () Bool)

(assert (=> b!13623 (= e!8358 e!8359)))

(declare-fun res!12920 () Bool)

(assert (=> b!13623 (=> (not res!12920) (not e!8359))))

(assert (=> b!13623 (= res!12920 (and (= (_2!856 lt!21279) false) (= (_1!856 lt!21279) (_2!857 lt!21280))))))

(assert (=> b!13623 (= lt!21279 (readBitPure!0 (readerFrom!0 (_2!857 lt!21280) (currentBit!1783 thiss!957) (currentByte!1788 thiss!957))))))

(declare-fun d!4388 () Bool)

(assert (=> d!4388 e!8358))

(declare-fun res!12919 () Bool)

(assert (=> d!4388 (=> (not res!12919) (not e!8358))))

(assert (=> d!4388 (= res!12919 (= (size!329 (buf!680 thiss!957)) (size!329 (buf!680 (_2!857 lt!21280)))))))

(declare-fun choose!16 (BitStream!618 Bool) tuple2!1604)

(assert (=> d!4388 (= lt!21280 (choose!16 thiss!957 false))))

(assert (=> d!4388 (validate_offset_bit!0 ((_ sign_extend 32) (size!329 (buf!680 thiss!957))) ((_ sign_extend 32) (currentByte!1788 thiss!957)) ((_ sign_extend 32) (currentBit!1783 thiss!957)))))

(assert (=> d!4388 (= (appendBit!0 thiss!957 false) lt!21280)))

(declare-fun b!13621 () Bool)

(declare-fun res!12921 () Bool)

(assert (=> b!13621 (=> (not res!12921) (not e!8358))))

(declare-fun lt!21281 () (_ BitVec 64))

(declare-fun lt!21278 () (_ BitVec 64))

(assert (=> b!13621 (= res!12921 (= (bitIndex!0 (size!329 (buf!680 (_2!857 lt!21280))) (currentByte!1788 (_2!857 lt!21280)) (currentBit!1783 (_2!857 lt!21280))) (bvadd lt!21278 lt!21281)))))

(assert (=> b!13621 (or (not (= (bvand lt!21278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21281 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21278 lt!21281) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13621 (= lt!21281 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13621 (= lt!21278 (bitIndex!0 (size!329 (buf!680 thiss!957)) (currentByte!1788 thiss!957) (currentBit!1783 thiss!957)))))

(declare-fun b!13622 () Bool)

(declare-fun res!12918 () Bool)

(assert (=> b!13622 (=> (not res!12918) (not e!8358))))

(assert (=> b!13622 (= res!12918 (isPrefixOf!0 thiss!957 (_2!857 lt!21280)))))

(assert (= (and d!4388 res!12919) b!13621))

(assert (= (and b!13621 res!12921) b!13622))

(assert (= (and b!13622 res!12918) b!13623))

(assert (= (and b!13623 res!12920) b!13624))

(declare-fun m!20229 () Bool)

(assert (=> b!13621 m!20229))

(assert (=> b!13621 m!20143))

(declare-fun m!20231 () Bool)

(assert (=> d!4388 m!20231))

(assert (=> d!4388 m!20147))

(declare-fun m!20233 () Bool)

(assert (=> b!13623 m!20233))

(assert (=> b!13623 m!20233))

(declare-fun m!20235 () Bool)

(assert (=> b!13623 m!20235))

(declare-fun m!20237 () Bool)

(assert (=> b!13622 m!20237))

(declare-fun m!20239 () Bool)

(assert (=> b!13624 m!20239))

(assert (=> b!13624 m!20229))

(assert (=> b!13534 d!4388))

(declare-fun d!4400 () Bool)

(assert (=> d!4400 (= (invariant!0 (currentBit!1783 (_2!857 lt!21197)) (currentByte!1788 (_2!857 lt!21197)) (size!329 (buf!680 (_2!857 lt!21197)))) (and (bvsge (currentBit!1783 (_2!857 lt!21197)) #b00000000000000000000000000000000) (bvslt (currentBit!1783 (_2!857 lt!21197)) #b00000000000000000000000000001000) (bvsge (currentByte!1788 (_2!857 lt!21197)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1788 (_2!857 lt!21197)) (size!329 (buf!680 (_2!857 lt!21197)))) (and (= (currentBit!1783 (_2!857 lt!21197)) #b00000000000000000000000000000000) (= (currentByte!1788 (_2!857 lt!21197)) (size!329 (buf!680 (_2!857 lt!21197))))))))))

(assert (=> b!13529 d!4400))

(declare-fun d!4402 () Bool)

(declare-datatypes ((tuple2!1612 0))(
  ( (tuple2!1613 (_1!861 Bool) (_2!861 BitStream!618)) )
))
(declare-fun lt!21294 () tuple2!1612)

(declare-fun readBit!0 (BitStream!618) tuple2!1612)

(assert (=> d!4402 (= lt!21294 (readBit!0 (readerFrom!0 (_2!857 lt!21197) (currentBit!1783 thiss!957) (currentByte!1788 thiss!957))))))

(assert (=> d!4402 (= (readBitPure!0 (readerFrom!0 (_2!857 lt!21197) (currentBit!1783 thiss!957) (currentByte!1788 thiss!957))) (tuple2!1603 (_2!861 lt!21294) (_1!861 lt!21294)))))

(declare-fun bs!1223 () Bool)

(assert (= bs!1223 d!4402))

(assert (=> bs!1223 m!20151))

(declare-fun m!20243 () Bool)

(assert (=> bs!1223 m!20243))

(assert (=> b!13535 d!4402))

(declare-fun d!4406 () Bool)

(declare-fun e!8372 () Bool)

(assert (=> d!4406 e!8372))

(declare-fun res!12942 () Bool)

(assert (=> d!4406 (=> (not res!12942) (not e!8372))))

(assert (=> d!4406 (= res!12942 (invariant!0 (currentBit!1783 (_2!857 lt!21197)) (currentByte!1788 (_2!857 lt!21197)) (size!329 (buf!680 (_2!857 lt!21197)))))))

(assert (=> d!4406 (= (readerFrom!0 (_2!857 lt!21197) (currentBit!1783 thiss!957) (currentByte!1788 thiss!957)) (BitStream!619 (buf!680 (_2!857 lt!21197)) (currentByte!1788 thiss!957) (currentBit!1783 thiss!957)))))

(declare-fun b!13644 () Bool)

(assert (=> b!13644 (= e!8372 (invariant!0 (currentBit!1783 thiss!957) (currentByte!1788 thiss!957) (size!329 (buf!680 (_2!857 lt!21197)))))))

(assert (= (and d!4406 res!12942) b!13644))

(assert (=> d!4406 m!20145))

(declare-fun m!20247 () Bool)

(assert (=> b!13644 m!20247))

(assert (=> b!13535 d!4406))

(assert (=> b!13530 d!4384))

(declare-fun d!4412 () Bool)

(assert (=> d!4412 (= (array_inv!318 (buf!680 thiss!957)) (bvsge (size!329 (buf!680 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13536 d!4412))

(assert (=> b!13531 d!4370))

(assert (=> b!13531 d!4382))

(check-sat (not b!13580) (not d!4402) (not b!13623) (not b!13624) (not d!4406) (not d!4366) (not b!13578) (not d!4382) (not b!13622) (not d!4386) (not b!13644) (not b!13621) (not d!4364) (not d!4388) (not d!4370))

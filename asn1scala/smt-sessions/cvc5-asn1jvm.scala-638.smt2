; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17926 () Bool)

(assert start!17926)

(declare-fun b!87895 () Bool)

(declare-fun e!58233 () Bool)

(declare-fun e!58236 () Bool)

(assert (=> b!87895 (= e!58233 e!58236)))

(declare-fun res!72324 () Bool)

(assert (=> b!87895 (=> (not res!72324) (not e!58236))))

(declare-fun lt!135903 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun lt!135902 () (_ BitVec 64))

(assert (=> b!87895 (= res!72324 (= lt!135903 (bvadd lt!135902 ((_ sign_extend 32) i!576))))))

(declare-datatypes ((array!4143 0))(
  ( (array!4144 (arr!2508 (Array (_ BitVec 32) (_ BitVec 8))) (size!1871 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3304 0))(
  ( (BitStream!3305 (buf!2261 array!4143) (currentByte!4485 (_ BitVec 32)) (currentBit!4480 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3304)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87895 (= lt!135903 (bitIndex!0 (size!1871 (buf!2261 thiss!1152)) (currentByte!4485 thiss!1152) (currentBit!4480 thiss!1152)))))

(declare-fun thiss!1151 () BitStream!3304)

(assert (=> b!87895 (= lt!135902 (bitIndex!0 (size!1871 (buf!2261 thiss!1151)) (currentByte!4485 thiss!1151) (currentBit!4480 thiss!1151)))))

(declare-fun b!87896 () Bool)

(declare-fun res!72325 () Bool)

(assert (=> b!87896 (=> (not res!72325) (not e!58233))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87896 (= res!72325 (validate_offset_bits!1 ((_ sign_extend 32) (size!1871 (buf!2261 thiss!1151))) ((_ sign_extend 32) (currentByte!4485 thiss!1151)) ((_ sign_extend 32) (currentBit!4480 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87897 () Bool)

(declare-fun res!72326 () Bool)

(assert (=> b!87897 (=> (not res!72326) (not e!58233))))

(assert (=> b!87897 (= res!72326 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87898 () Bool)

(declare-fun res!72331 () Bool)

(assert (=> b!87898 (=> (not res!72331) (not e!58233))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87898 (= res!72331 (invariant!0 (currentBit!4480 thiss!1152) (currentByte!4485 thiss!1152) (size!1871 (buf!2261 thiss!1152))))))

(declare-fun b!87899 () Bool)

(declare-fun e!58230 () Bool)

(declare-fun e!58231 () Bool)

(assert (=> b!87899 (= e!58230 e!58231)))

(declare-fun res!72339 () Bool)

(assert (=> b!87899 (=> (not res!72339) (not e!58231))))

(declare-fun lt!135904 () Bool)

(declare-datatypes ((tuple2!7426 0))(
  ( (tuple2!7427 (_1!3946 BitStream!3304) (_2!3946 Bool)) )
))
(declare-fun lt!135905 () tuple2!7426)

(declare-datatypes ((Unit!5761 0))(
  ( (Unit!5762) )
))
(declare-datatypes ((tuple2!7428 0))(
  ( (tuple2!7429 (_1!3947 Unit!5761) (_2!3947 BitStream!3304)) )
))
(declare-fun lt!135906 () tuple2!7428)

(assert (=> b!87899 (= res!72339 (and (= (_2!3946 lt!135905) lt!135904) (= (_1!3946 lt!135905) (_2!3947 lt!135906))))))

(declare-fun readBitPure!0 (BitStream!3304) tuple2!7426)

(declare-fun readerFrom!0 (BitStream!3304 (_ BitVec 32) (_ BitVec 32)) BitStream!3304)

(assert (=> b!87899 (= lt!135905 (readBitPure!0 (readerFrom!0 (_2!3947 lt!135906) (currentBit!4480 thiss!1152) (currentByte!4485 thiss!1152))))))

(declare-fun b!87901 () Bool)

(declare-fun e!58234 () Bool)

(assert (=> b!87901 (= e!58234 e!58230)))

(declare-fun res!72337 () Bool)

(assert (=> b!87901 (=> (not res!72337) (not e!58230))))

(declare-fun lt!135901 () (_ BitVec 64))

(assert (=> b!87901 (= res!72337 (= lt!135901 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135903)))))

(assert (=> b!87901 (= lt!135901 (bitIndex!0 (size!1871 (buf!2261 (_2!3947 lt!135906))) (currentByte!4485 (_2!3947 lt!135906)) (currentBit!4480 (_2!3947 lt!135906))))))

(declare-fun b!87902 () Bool)

(declare-fun e!58238 () Bool)

(assert (=> b!87902 (= e!58238 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4480 (_2!3947 lt!135906)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4485 (_2!3947 lt!135906)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1871 (buf!2261 (_2!3947 lt!135906)))))))))

(declare-fun b!87903 () Bool)

(declare-fun res!72329 () Bool)

(assert (=> b!87903 (=> (not res!72329) (not e!58233))))

(assert (=> b!87903 (= res!72329 (invariant!0 (currentBit!4480 thiss!1151) (currentByte!4485 thiss!1151) (size!1871 (buf!2261 thiss!1151))))))

(declare-fun b!87904 () Bool)

(declare-fun res!72328 () Bool)

(assert (=> b!87904 (=> res!72328 e!58238)))

(assert (=> b!87904 (= res!72328 (not (= (bitIndex!0 (size!1871 (buf!2261 (_2!3947 lt!135906))) (currentByte!4485 (_2!3947 lt!135906)) (currentBit!4480 (_2!3947 lt!135906))) (bvadd lt!135902 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!87905 () Bool)

(declare-fun res!72334 () Bool)

(assert (=> b!87905 (=> (not res!72334) (not e!58233))))

(assert (=> b!87905 (= res!72334 (and (bvsle i!576 nBits!336) (= (size!1871 (buf!2261 thiss!1152)) (size!1871 (buf!2261 thiss!1151)))))))

(declare-fun b!87906 () Bool)

(declare-fun e!58237 () Bool)

(declare-fun array_inv!1717 (array!4143) Bool)

(assert (=> b!87906 (= e!58237 (array_inv!1717 (buf!2261 thiss!1151)))))

(declare-fun b!87907 () Bool)

(declare-fun res!72338 () Bool)

(assert (=> b!87907 (=> (not res!72338) (not e!58230))))

(declare-fun isPrefixOf!0 (BitStream!3304 BitStream!3304) Bool)

(assert (=> b!87907 (= res!72338 (isPrefixOf!0 thiss!1152 (_2!3947 lt!135906)))))

(declare-fun b!87908 () Bool)

(declare-fun res!72340 () Bool)

(assert (=> b!87908 (=> res!72340 e!58238)))

(assert (=> b!87908 (= res!72340 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1871 (buf!2261 (_2!3947 lt!135906))) (size!1871 (buf!2261 thiss!1151))))))))

(declare-fun b!87909 () Bool)

(assert (=> b!87909 (= e!58231 (= (bitIndex!0 (size!1871 (buf!2261 (_1!3946 lt!135905))) (currentByte!4485 (_1!3946 lt!135905)) (currentBit!4480 (_1!3946 lt!135905))) lt!135901))))

(declare-fun b!87910 () Bool)

(declare-fun res!72336 () Bool)

(assert (=> b!87910 (=> (not res!72336) (not e!58236))))

(assert (=> b!87910 (= res!72336 (bvslt i!576 nBits!336))))

(declare-fun b!87911 () Bool)

(declare-fun e!58235 () Bool)

(assert (=> b!87911 (= e!58235 (array_inv!1717 (buf!2261 thiss!1152)))))

(declare-fun b!87900 () Bool)

(declare-fun res!72332 () Bool)

(assert (=> b!87900 (=> res!72332 e!58238)))

(assert (=> b!87900 (= res!72332 (or (bvsgt ((_ sign_extend 32) (size!1871 (buf!2261 (_2!3947 lt!135906)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4485 (_2!3947 lt!135906))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4480 (_2!3947 lt!135906))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1871 (buf!2261 (_2!3947 lt!135906)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4485 (_2!3947 lt!135906))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4480 (_2!3947 lt!135906))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!72327 () Bool)

(assert (=> start!17926 (=> (not res!72327) (not e!58233))))

(assert (=> start!17926 (= res!72327 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17926 e!58233))

(declare-fun inv!12 (BitStream!3304) Bool)

(assert (=> start!17926 (and (inv!12 thiss!1152) e!58235)))

(assert (=> start!17926 (and (inv!12 thiss!1151) e!58237)))

(assert (=> start!17926 true))

(declare-fun b!87912 () Bool)

(assert (=> b!87912 (= e!58236 (not e!58238))))

(declare-fun res!72335 () Bool)

(assert (=> b!87912 (=> res!72335 e!58238)))

(assert (=> b!87912 (= res!72335 (not (invariant!0 (currentBit!4480 (_2!3947 lt!135906)) (currentByte!4485 (_2!3947 lt!135906)) (size!1871 (buf!2261 (_2!3947 lt!135906))))))))

(assert (=> b!87912 e!58234))

(declare-fun res!72330 () Bool)

(assert (=> b!87912 (=> (not res!72330) (not e!58234))))

(assert (=> b!87912 (= res!72330 (= (size!1871 (buf!2261 thiss!1152)) (size!1871 (buf!2261 (_2!3947 lt!135906)))))))

(declare-fun appendBit!0 (BitStream!3304 Bool) tuple2!7428)

(assert (=> b!87912 (= lt!135906 (appendBit!0 thiss!1152 lt!135904))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87912 (= lt!135904 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87913 () Bool)

(declare-fun res!72333 () Bool)

(assert (=> b!87913 (=> (not res!72333) (not e!58236))))

(assert (=> b!87913 (= res!72333 (validate_offset_bits!1 ((_ sign_extend 32) (size!1871 (buf!2261 thiss!1152))) ((_ sign_extend 32) (currentByte!4485 thiss!1152)) ((_ sign_extend 32) (currentBit!4480 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(assert (= (and start!17926 res!72327) b!87896))

(assert (= (and b!87896 res!72325) b!87903))

(assert (= (and b!87903 res!72329) b!87897))

(assert (= (and b!87897 res!72326) b!87898))

(assert (= (and b!87898 res!72331) b!87905))

(assert (= (and b!87905 res!72334) b!87895))

(assert (= (and b!87895 res!72324) b!87913))

(assert (= (and b!87913 res!72333) b!87910))

(assert (= (and b!87910 res!72336) b!87912))

(assert (= (and b!87912 res!72330) b!87901))

(assert (= (and b!87901 res!72337) b!87907))

(assert (= (and b!87907 res!72338) b!87899))

(assert (= (and b!87899 res!72339) b!87909))

(assert (= (and b!87912 (not res!72335)) b!87908))

(assert (= (and b!87908 (not res!72340)) b!87904))

(assert (= (and b!87904 (not res!72328)) b!87900))

(assert (= (and b!87900 (not res!72332)) b!87902))

(assert (= start!17926 b!87911))

(assert (= start!17926 b!87906))

(declare-fun m!133229 () Bool)

(assert (=> b!87903 m!133229))

(declare-fun m!133231 () Bool)

(assert (=> start!17926 m!133231))

(declare-fun m!133233 () Bool)

(assert (=> start!17926 m!133233))

(declare-fun m!133235 () Bool)

(assert (=> b!87913 m!133235))

(declare-fun m!133237 () Bool)

(assert (=> b!87904 m!133237))

(declare-fun m!133239 () Bool)

(assert (=> b!87909 m!133239))

(declare-fun m!133241 () Bool)

(assert (=> b!87898 m!133241))

(declare-fun m!133243 () Bool)

(assert (=> b!87899 m!133243))

(assert (=> b!87899 m!133243))

(declare-fun m!133245 () Bool)

(assert (=> b!87899 m!133245))

(declare-fun m!133247 () Bool)

(assert (=> b!87896 m!133247))

(declare-fun m!133249 () Bool)

(assert (=> b!87902 m!133249))

(declare-fun m!133251 () Bool)

(assert (=> b!87911 m!133251))

(declare-fun m!133253 () Bool)

(assert (=> b!87906 m!133253))

(declare-fun m!133255 () Bool)

(assert (=> b!87907 m!133255))

(declare-fun m!133257 () Bool)

(assert (=> b!87895 m!133257))

(declare-fun m!133259 () Bool)

(assert (=> b!87895 m!133259))

(declare-fun m!133261 () Bool)

(assert (=> b!87912 m!133261))

(declare-fun m!133263 () Bool)

(assert (=> b!87912 m!133263))

(assert (=> b!87901 m!133237))

(push 1)

(assert (not b!87907))

(assert (not b!87904))

(assert (not b!87898))

(assert (not b!87912))

(assert (not b!87902))

(assert (not b!87901))

(assert (not b!87903))

(assert (not b!87913))

(assert (not b!87895))

(assert (not b!87896))

(assert (not b!87909))

(assert (not b!87899))

(assert (not b!87911))

(assert (not b!87906))

(assert (not start!17926))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


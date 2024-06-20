; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17934 () Bool)

(assert start!17934)

(declare-fun b!88128 () Bool)

(declare-fun e!58356 () Bool)

(declare-datatypes ((array!4151 0))(
  ( (array!4152 (arr!2512 (Array (_ BitVec 32) (_ BitVec 8))) (size!1875 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3312 0))(
  ( (BitStream!3313 (buf!2265 array!4151) (currentByte!4489 (_ BitVec 32)) (currentBit!4484 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!7442 0))(
  ( (tuple2!7443 (_1!3954 BitStream!3312) (_2!3954 Bool)) )
))
(declare-fun lt!135977 () tuple2!7442)

(declare-fun lt!135973 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88128 (= e!58356 (= (bitIndex!0 (size!1875 (buf!2265 (_1!3954 lt!135977))) (currentByte!4489 (_1!3954 lt!135977)) (currentBit!4484 (_1!3954 lt!135977))) lt!135973))))

(declare-fun b!88129 () Bool)

(declare-fun e!58357 () Bool)

(declare-fun thiss!1151 () BitStream!3312)

(declare-fun array_inv!1721 (array!4151) Bool)

(assert (=> b!88129 (= e!58357 (array_inv!1721 (buf!2265 thiss!1151)))))

(declare-fun b!88131 () Bool)

(declare-fun res!72544 () Bool)

(declare-fun e!58354 () Bool)

(assert (=> b!88131 (=> res!72544 e!58354)))

(declare-datatypes ((Unit!5769 0))(
  ( (Unit!5770) )
))
(declare-datatypes ((tuple2!7444 0))(
  ( (tuple2!7445 (_1!3955 Unit!5769) (_2!3955 BitStream!3312)) )
))
(declare-fun lt!135978 () tuple2!7444)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88131 (= res!72544 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4484 (_2!3955 lt!135978)))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4489 (_2!3955 lt!135978)))) ((_ extract 31 0) ((_ sign_extend 32) (size!1875 (buf!2265 (_2!3955 lt!135978))))))))))

(declare-fun b!88132 () Bool)

(declare-fun res!72536 () Bool)

(declare-fun e!58359 () Bool)

(assert (=> b!88132 (=> (not res!72536) (not e!58359))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!88132 (= res!72536 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88133 () Bool)

(declare-fun res!72546 () Bool)

(assert (=> b!88133 (=> (not res!72546) (not e!58359))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88133 (= res!72546 (validate_offset_bits!1 ((_ sign_extend 32) (size!1875 (buf!2265 thiss!1151))) ((_ sign_extend 32) (currentByte!4489 thiss!1151)) ((_ sign_extend 32) (currentBit!4484 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88134 () Bool)

(declare-fun e!58352 () Bool)

(declare-fun thiss!1152 () BitStream!3312)

(assert (=> b!88134 (= e!58352 (array_inv!1721 (buf!2265 thiss!1152)))))

(declare-fun b!88135 () Bool)

(declare-fun e!58351 () Bool)

(declare-fun e!58358 () Bool)

(assert (=> b!88135 (= e!58351 e!58358)))

(declare-fun res!72540 () Bool)

(assert (=> b!88135 (=> (not res!72540) (not e!58358))))

(declare-fun lt!135974 () (_ BitVec 64))

(assert (=> b!88135 (= res!72540 (= lt!135973 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135974)))))

(assert (=> b!88135 (= lt!135973 (bitIndex!0 (size!1875 (buf!2265 (_2!3955 lt!135978))) (currentByte!4489 (_2!3955 lt!135978)) (currentBit!4484 (_2!3955 lt!135978))))))

(declare-fun b!88136 () Bool)

(assert (=> b!88136 (= e!58354 (bvsge ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!88137 () Bool)

(declare-fun res!72537 () Bool)

(declare-fun e!58355 () Bool)

(assert (=> b!88137 (=> (not res!72537) (not e!58355))))

(assert (=> b!88137 (= res!72537 (bvslt i!576 nBits!336))))

(declare-fun b!88138 () Bool)

(declare-fun res!72547 () Bool)

(assert (=> b!88138 (=> (not res!72547) (not e!58359))))

(assert (=> b!88138 (= res!72547 (and (bvsle i!576 nBits!336) (= (size!1875 (buf!2265 thiss!1152)) (size!1875 (buf!2265 thiss!1151)))))))

(declare-fun b!88139 () Bool)

(assert (=> b!88139 (= e!58359 e!58355)))

(declare-fun res!72533 () Bool)

(assert (=> b!88139 (=> (not res!72533) (not e!58355))))

(declare-fun lt!135976 () (_ BitVec 64))

(assert (=> b!88139 (= res!72533 (= lt!135974 (bvadd lt!135976 ((_ sign_extend 32) i!576))))))

(assert (=> b!88139 (= lt!135974 (bitIndex!0 (size!1875 (buf!2265 thiss!1152)) (currentByte!4489 thiss!1152) (currentBit!4484 thiss!1152)))))

(assert (=> b!88139 (= lt!135976 (bitIndex!0 (size!1875 (buf!2265 thiss!1151)) (currentByte!4489 thiss!1151) (currentBit!4484 thiss!1151)))))

(declare-fun b!88140 () Bool)

(declare-fun res!72535 () Bool)

(assert (=> b!88140 (=> (not res!72535) (not e!58359))))

(assert (=> b!88140 (= res!72535 (invariant!0 (currentBit!4484 thiss!1152) (currentByte!4489 thiss!1152) (size!1875 (buf!2265 thiss!1152))))))

(declare-fun b!88141 () Bool)

(declare-fun res!72534 () Bool)

(assert (=> b!88141 (=> res!72534 e!58354)))

(assert (=> b!88141 (= res!72534 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1875 (buf!2265 (_2!3955 lt!135978))) (size!1875 (buf!2265 thiss!1151))))))))

(declare-fun b!88142 () Bool)

(declare-fun res!72548 () Bool)

(assert (=> b!88142 (=> (not res!72548) (not e!58359))))

(assert (=> b!88142 (= res!72548 (invariant!0 (currentBit!4484 thiss!1151) (currentByte!4489 thiss!1151) (size!1875 (buf!2265 thiss!1151))))))

(declare-fun b!88143 () Bool)

(assert (=> b!88143 (= e!58358 e!58356)))

(declare-fun res!72545 () Bool)

(assert (=> b!88143 (=> (not res!72545) (not e!58356))))

(declare-fun lt!135975 () Bool)

(assert (=> b!88143 (= res!72545 (and (= (_2!3954 lt!135977) lt!135975) (= (_1!3954 lt!135977) (_2!3955 lt!135978))))))

(declare-fun readBitPure!0 (BitStream!3312) tuple2!7442)

(declare-fun readerFrom!0 (BitStream!3312 (_ BitVec 32) (_ BitVec 32)) BitStream!3312)

(assert (=> b!88143 (= lt!135977 (readBitPure!0 (readerFrom!0 (_2!3955 lt!135978) (currentBit!4484 thiss!1152) (currentByte!4489 thiss!1152))))))

(declare-fun b!88130 () Bool)

(assert (=> b!88130 (= e!58355 (not e!58354))))

(declare-fun res!72541 () Bool)

(assert (=> b!88130 (=> res!72541 e!58354)))

(assert (=> b!88130 (= res!72541 (not (invariant!0 (currentBit!4484 (_2!3955 lt!135978)) (currentByte!4489 (_2!3955 lt!135978)) (size!1875 (buf!2265 (_2!3955 lt!135978))))))))

(assert (=> b!88130 e!58351))

(declare-fun res!72539 () Bool)

(assert (=> b!88130 (=> (not res!72539) (not e!58351))))

(assert (=> b!88130 (= res!72539 (= (size!1875 (buf!2265 thiss!1152)) (size!1875 (buf!2265 (_2!3955 lt!135978)))))))

(declare-fun appendBit!0 (BitStream!3312 Bool) tuple2!7444)

(assert (=> b!88130 (= lt!135978 (appendBit!0 thiss!1152 lt!135975))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!88130 (= lt!135975 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!72538 () Bool)

(assert (=> start!17934 (=> (not res!72538) (not e!58359))))

(assert (=> start!17934 (= res!72538 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17934 e!58359))

(declare-fun inv!12 (BitStream!3312) Bool)

(assert (=> start!17934 (and (inv!12 thiss!1152) e!58352)))

(assert (=> start!17934 (and (inv!12 thiss!1151) e!58357)))

(assert (=> start!17934 true))

(declare-fun b!88144 () Bool)

(declare-fun res!72550 () Bool)

(assert (=> b!88144 (=> res!72550 e!58354)))

(assert (=> b!88144 (= res!72550 (not (= (bitIndex!0 (size!1875 (buf!2265 (_2!3955 lt!135978))) (currentByte!4489 (_2!3955 lt!135978)) (currentBit!4484 (_2!3955 lt!135978))) (bvadd lt!135976 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!88145 () Bool)

(declare-fun res!72543 () Bool)

(assert (=> b!88145 (=> res!72543 e!58354)))

(assert (=> b!88145 (= res!72543 (or (bvsgt ((_ sign_extend 32) (size!1875 (buf!2265 (_2!3955 lt!135978)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4489 (_2!3955 lt!135978))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4484 (_2!3955 lt!135978))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1875 (buf!2265 (_2!3955 lt!135978)))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4489 (_2!3955 lt!135978))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4484 (_2!3955 lt!135978))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!88146 () Bool)

(declare-fun res!72542 () Bool)

(assert (=> b!88146 (=> (not res!72542) (not e!58355))))

(assert (=> b!88146 (= res!72542 (validate_offset_bits!1 ((_ sign_extend 32) (size!1875 (buf!2265 thiss!1152))) ((_ sign_extend 32) (currentByte!4489 thiss!1152)) ((_ sign_extend 32) (currentBit!4484 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88147 () Bool)

(declare-fun res!72549 () Bool)

(assert (=> b!88147 (=> (not res!72549) (not e!58358))))

(declare-fun isPrefixOf!0 (BitStream!3312 BitStream!3312) Bool)

(assert (=> b!88147 (= res!72549 (isPrefixOf!0 thiss!1152 (_2!3955 lt!135978)))))

(assert (= (and start!17934 res!72538) b!88133))

(assert (= (and b!88133 res!72546) b!88142))

(assert (= (and b!88142 res!72548) b!88132))

(assert (= (and b!88132 res!72536) b!88140))

(assert (= (and b!88140 res!72535) b!88138))

(assert (= (and b!88138 res!72547) b!88139))

(assert (= (and b!88139 res!72533) b!88146))

(assert (= (and b!88146 res!72542) b!88137))

(assert (= (and b!88137 res!72537) b!88130))

(assert (= (and b!88130 res!72539) b!88135))

(assert (= (and b!88135 res!72540) b!88147))

(assert (= (and b!88147 res!72549) b!88143))

(assert (= (and b!88143 res!72545) b!88128))

(assert (= (and b!88130 (not res!72541)) b!88141))

(assert (= (and b!88141 (not res!72534)) b!88144))

(assert (= (and b!88144 (not res!72550)) b!88145))

(assert (= (and b!88145 (not res!72543)) b!88131))

(assert (= (and b!88131 (not res!72544)) b!88136))

(assert (= start!17934 b!88134))

(assert (= start!17934 b!88129))

(declare-fun m!133373 () Bool)

(assert (=> b!88147 m!133373))

(declare-fun m!133375 () Bool)

(assert (=> b!88143 m!133375))

(assert (=> b!88143 m!133375))

(declare-fun m!133377 () Bool)

(assert (=> b!88143 m!133377))

(declare-fun m!133379 () Bool)

(assert (=> b!88134 m!133379))

(declare-fun m!133381 () Bool)

(assert (=> b!88146 m!133381))

(declare-fun m!133383 () Bool)

(assert (=> b!88128 m!133383))

(declare-fun m!133385 () Bool)

(assert (=> b!88130 m!133385))

(declare-fun m!133387 () Bool)

(assert (=> b!88130 m!133387))

(declare-fun m!133389 () Bool)

(assert (=> b!88133 m!133389))

(declare-fun m!133391 () Bool)

(assert (=> b!88144 m!133391))

(declare-fun m!133393 () Bool)

(assert (=> start!17934 m!133393))

(declare-fun m!133395 () Bool)

(assert (=> start!17934 m!133395))

(declare-fun m!133397 () Bool)

(assert (=> b!88140 m!133397))

(declare-fun m!133399 () Bool)

(assert (=> b!88142 m!133399))

(declare-fun m!133401 () Bool)

(assert (=> b!88139 m!133401))

(declare-fun m!133403 () Bool)

(assert (=> b!88139 m!133403))

(declare-fun m!133405 () Bool)

(assert (=> b!88129 m!133405))

(assert (=> b!88135 m!133391))

(declare-fun m!133407 () Bool)

(assert (=> b!88131 m!133407))

(check-sat (not b!88135) (not b!88129) (not b!88133) (not start!17934) (not b!88147) (not b!88146) (not b!88143) (not b!88128) (not b!88142) (not b!88139) (not b!88130) (not b!88144) (not b!88134) (not b!88131) (not b!88140))
(check-sat)

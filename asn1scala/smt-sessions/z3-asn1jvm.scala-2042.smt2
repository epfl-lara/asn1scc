; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52062 () Bool)

(assert start!52062)

(declare-fun b!239862 () Bool)

(declare-fun e!166315 () Bool)

(declare-datatypes ((array!13107 0))(
  ( (array!13108 (arr!6728 (Array (_ BitVec 32) (_ BitVec 8))) (size!5741 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10404 0))(
  ( (BitStream!10405 (buf!6195 array!13107) (currentByte!11537 (_ BitVec 32)) (currentBit!11532 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20286 0))(
  ( (tuple2!20287 (_1!11065 BitStream!10404) (_2!11065 Bool)) )
))
(declare-fun lt!374483 () tuple2!20286)

(declare-datatypes ((tuple2!20288 0))(
  ( (tuple2!20289 (_1!11066 BitStream!10404) (_2!11066 BitStream!10404)) )
))
(declare-fun lt!374481 () tuple2!20288)

(assert (=> b!239862 (= e!166315 (not (or (not (_2!11065 lt!374483)) (not (= (_1!11065 lt!374483) (_2!11066 lt!374481))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10404 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20286)

(assert (=> b!239862 (= lt!374483 (checkBitsLoopPure!0 (_1!11066 lt!374481) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17577 0))(
  ( (Unit!17578) )
))
(declare-datatypes ((tuple2!20290 0))(
  ( (tuple2!20291 (_1!11067 Unit!17577) (_2!11067 BitStream!10404)) )
))
(declare-fun lt!374484 () tuple2!20290)

(declare-fun thiss!982 () BitStream!10404)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!239862 (validate_offset_bits!1 ((_ sign_extend 32) (size!5741 (buf!6195 (_2!11067 lt!374484)))) ((_ sign_extend 32) (currentByte!11537 thiss!982)) ((_ sign_extend 32) (currentBit!11532 thiss!982)) nBits!288)))

(declare-fun lt!374482 () Unit!17577)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10404 array!13107 (_ BitVec 64)) Unit!17577)

(assert (=> b!239862 (= lt!374482 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6195 (_2!11067 lt!374484)) nBits!288))))

(declare-fun reader!0 (BitStream!10404 BitStream!10404) tuple2!20288)

(assert (=> b!239862 (= lt!374481 (reader!0 thiss!982 (_2!11067 lt!374484)))))

(declare-fun b!239863 () Bool)

(declare-fun res!200233 () Bool)

(assert (=> b!239863 (=> (not res!200233) (not e!166315))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!239863 (= res!200233 (= (bitIndex!0 (size!5741 (buf!6195 (_2!11067 lt!374484))) (currentByte!11537 (_2!11067 lt!374484)) (currentBit!11532 (_2!11067 lt!374484))) (bvadd (bitIndex!0 (size!5741 (buf!6195 thiss!982)) (currentByte!11537 thiss!982) (currentBit!11532 thiss!982)) nBits!288)))))

(declare-fun res!200235 () Bool)

(declare-fun e!166313 () Bool)

(assert (=> start!52062 (=> (not res!200235) (not e!166313))))

(assert (=> start!52062 (= res!200235 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52062 e!166313))

(assert (=> start!52062 true))

(declare-fun e!166314 () Bool)

(declare-fun inv!12 (BitStream!10404) Bool)

(assert (=> start!52062 (and (inv!12 thiss!982) e!166314)))

(declare-fun b!239864 () Bool)

(declare-fun array_inv!5482 (array!13107) Bool)

(assert (=> b!239864 (= e!166314 (array_inv!5482 (buf!6195 thiss!982)))))

(declare-fun b!239865 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!239865 (= e!166313 (not (invariant!0 (currentBit!11532 (_2!11067 lt!374484)) (currentByte!11537 (_2!11067 lt!374484)) (size!5741 (buf!6195 (_2!11067 lt!374484))))))))

(assert (=> b!239865 e!166315))

(declare-fun res!200232 () Bool)

(assert (=> b!239865 (=> (not res!200232) (not e!166315))))

(assert (=> b!239865 (= res!200232 (= (size!5741 (buf!6195 thiss!982)) (size!5741 (buf!6195 (_2!11067 lt!374484)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10404 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20290)

(assert (=> b!239865 (= lt!374484 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!239866 () Bool)

(declare-fun res!200234 () Bool)

(assert (=> b!239866 (=> (not res!200234) (not e!166313))))

(assert (=> b!239866 (= res!200234 (validate_offset_bits!1 ((_ sign_extend 32) (size!5741 (buf!6195 thiss!982))) ((_ sign_extend 32) (currentByte!11537 thiss!982)) ((_ sign_extend 32) (currentBit!11532 thiss!982)) nBits!288))))

(declare-fun b!239867 () Bool)

(declare-fun res!200231 () Bool)

(assert (=> b!239867 (=> (not res!200231) (not e!166315))))

(declare-fun isPrefixOf!0 (BitStream!10404 BitStream!10404) Bool)

(assert (=> b!239867 (= res!200231 (isPrefixOf!0 thiss!982 (_2!11067 lt!374484)))))

(assert (= (and start!52062 res!200235) b!239866))

(assert (= (and b!239866 res!200234) b!239865))

(assert (= (and b!239865 res!200232) b!239863))

(assert (= (and b!239863 res!200233) b!239867))

(assert (= (and b!239867 res!200231) b!239862))

(assert (= start!52062 b!239864))

(declare-fun m!362181 () Bool)

(assert (=> b!239864 m!362181))

(declare-fun m!362183 () Bool)

(assert (=> start!52062 m!362183))

(declare-fun m!362185 () Bool)

(assert (=> b!239866 m!362185))

(declare-fun m!362187 () Bool)

(assert (=> b!239863 m!362187))

(declare-fun m!362189 () Bool)

(assert (=> b!239863 m!362189))

(declare-fun m!362191 () Bool)

(assert (=> b!239862 m!362191))

(declare-fun m!362193 () Bool)

(assert (=> b!239862 m!362193))

(declare-fun m!362195 () Bool)

(assert (=> b!239862 m!362195))

(declare-fun m!362197 () Bool)

(assert (=> b!239862 m!362197))

(declare-fun m!362199 () Bool)

(assert (=> b!239867 m!362199))

(declare-fun m!362201 () Bool)

(assert (=> b!239865 m!362201))

(declare-fun m!362203 () Bool)

(assert (=> b!239865 m!362203))

(check-sat (not b!239865) (not b!239863) (not b!239867) (not b!239866) (not b!239864) (not b!239862) (not start!52062))
(check-sat)
(get-model)

(declare-fun d!81154 () Bool)

(declare-fun e!166331 () Bool)

(assert (=> d!81154 e!166331))

(declare-fun res!200255 () Bool)

(assert (=> d!81154 (=> (not res!200255) (not e!166331))))

(declare-fun lt!374514 () (_ BitVec 64))

(declare-fun lt!374511 () (_ BitVec 64))

(declare-fun lt!374509 () (_ BitVec 64))

(assert (=> d!81154 (= res!200255 (= lt!374511 (bvsub lt!374509 lt!374514)))))

(assert (=> d!81154 (or (= (bvand lt!374509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374514 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374509 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374509 lt!374514) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81154 (= lt!374514 (remainingBits!0 ((_ sign_extend 32) (size!5741 (buf!6195 (_2!11067 lt!374484)))) ((_ sign_extend 32) (currentByte!11537 (_2!11067 lt!374484))) ((_ sign_extend 32) (currentBit!11532 (_2!11067 lt!374484)))))))

(declare-fun lt!374513 () (_ BitVec 64))

(declare-fun lt!374510 () (_ BitVec 64))

(assert (=> d!81154 (= lt!374509 (bvmul lt!374513 lt!374510))))

(assert (=> d!81154 (or (= lt!374513 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374510 (bvsdiv (bvmul lt!374513 lt!374510) lt!374513)))))

(assert (=> d!81154 (= lt!374510 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81154 (= lt!374513 ((_ sign_extend 32) (size!5741 (buf!6195 (_2!11067 lt!374484)))))))

(assert (=> d!81154 (= lt!374511 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11537 (_2!11067 lt!374484))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11532 (_2!11067 lt!374484)))))))

(assert (=> d!81154 (invariant!0 (currentBit!11532 (_2!11067 lt!374484)) (currentByte!11537 (_2!11067 lt!374484)) (size!5741 (buf!6195 (_2!11067 lt!374484))))))

(assert (=> d!81154 (= (bitIndex!0 (size!5741 (buf!6195 (_2!11067 lt!374484))) (currentByte!11537 (_2!11067 lt!374484)) (currentBit!11532 (_2!11067 lt!374484))) lt!374511)))

(declare-fun b!239890 () Bool)

(declare-fun res!200256 () Bool)

(assert (=> b!239890 (=> (not res!200256) (not e!166331))))

(assert (=> b!239890 (= res!200256 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374511))))

(declare-fun b!239891 () Bool)

(declare-fun lt!374512 () (_ BitVec 64))

(assert (=> b!239891 (= e!166331 (bvsle lt!374511 (bvmul lt!374512 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239891 (or (= lt!374512 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374512 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374512)))))

(assert (=> b!239891 (= lt!374512 ((_ sign_extend 32) (size!5741 (buf!6195 (_2!11067 lt!374484)))))))

(assert (= (and d!81154 res!200255) b!239890))

(assert (= (and b!239890 res!200256) b!239891))

(declare-fun m!362229 () Bool)

(assert (=> d!81154 m!362229))

(assert (=> d!81154 m!362201))

(assert (=> b!239863 d!81154))

(declare-fun d!81156 () Bool)

(declare-fun e!166332 () Bool)

(assert (=> d!81156 e!166332))

(declare-fun res!200257 () Bool)

(assert (=> d!81156 (=> (not res!200257) (not e!166332))))

(declare-fun lt!374520 () (_ BitVec 64))

(declare-fun lt!374515 () (_ BitVec 64))

(declare-fun lt!374517 () (_ BitVec 64))

(assert (=> d!81156 (= res!200257 (= lt!374517 (bvsub lt!374515 lt!374520)))))

(assert (=> d!81156 (or (= (bvand lt!374515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374520 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374515 lt!374520) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81156 (= lt!374520 (remainingBits!0 ((_ sign_extend 32) (size!5741 (buf!6195 thiss!982))) ((_ sign_extend 32) (currentByte!11537 thiss!982)) ((_ sign_extend 32) (currentBit!11532 thiss!982))))))

(declare-fun lt!374519 () (_ BitVec 64))

(declare-fun lt!374516 () (_ BitVec 64))

(assert (=> d!81156 (= lt!374515 (bvmul lt!374519 lt!374516))))

(assert (=> d!81156 (or (= lt!374519 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!374516 (bvsdiv (bvmul lt!374519 lt!374516) lt!374519)))))

(assert (=> d!81156 (= lt!374516 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81156 (= lt!374519 ((_ sign_extend 32) (size!5741 (buf!6195 thiss!982))))))

(assert (=> d!81156 (= lt!374517 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11537 thiss!982)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11532 thiss!982))))))

(assert (=> d!81156 (invariant!0 (currentBit!11532 thiss!982) (currentByte!11537 thiss!982) (size!5741 (buf!6195 thiss!982)))))

(assert (=> d!81156 (= (bitIndex!0 (size!5741 (buf!6195 thiss!982)) (currentByte!11537 thiss!982) (currentBit!11532 thiss!982)) lt!374517)))

(declare-fun b!239892 () Bool)

(declare-fun res!200258 () Bool)

(assert (=> b!239892 (=> (not res!200258) (not e!166332))))

(assert (=> b!239892 (= res!200258 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!374517))))

(declare-fun b!239893 () Bool)

(declare-fun lt!374518 () (_ BitVec 64))

(assert (=> b!239893 (= e!166332 (bvsle lt!374517 (bvmul lt!374518 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!239893 (or (= lt!374518 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!374518 #b0000000000000000000000000000000000000000000000000000000000001000) lt!374518)))))

(assert (=> b!239893 (= lt!374518 ((_ sign_extend 32) (size!5741 (buf!6195 thiss!982))))))

(assert (= (and d!81156 res!200257) b!239892))

(assert (= (and b!239892 res!200258) b!239893))

(declare-fun m!362231 () Bool)

(assert (=> d!81156 m!362231))

(declare-fun m!362233 () Bool)

(assert (=> d!81156 m!362233))

(assert (=> b!239863 d!81156))

(declare-datatypes ((tuple2!20302 0))(
  ( (tuple2!20303 (_1!11073 Bool) (_2!11073 BitStream!10404)) )
))
(declare-fun lt!374523 () tuple2!20302)

(declare-fun d!81158 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10404 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20302)

(assert (=> d!81158 (= lt!374523 (checkBitsLoop!0 (_1!11066 lt!374481) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!81158 (= (checkBitsLoopPure!0 (_1!11066 lt!374481) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!20287 (_2!11073 lt!374523) (_1!11073 lt!374523)))))

(declare-fun bs!20459 () Bool)

(assert (= bs!20459 d!81158))

(declare-fun m!362235 () Bool)

(assert (=> bs!20459 m!362235))

(assert (=> b!239862 d!81158))

(declare-fun d!81164 () Bool)

(assert (=> d!81164 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5741 (buf!6195 (_2!11067 lt!374484)))) ((_ sign_extend 32) (currentByte!11537 thiss!982)) ((_ sign_extend 32) (currentBit!11532 thiss!982)) nBits!288) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5741 (buf!6195 (_2!11067 lt!374484)))) ((_ sign_extend 32) (currentByte!11537 thiss!982)) ((_ sign_extend 32) (currentBit!11532 thiss!982))) nBits!288))))

(declare-fun bs!20460 () Bool)

(assert (= bs!20460 d!81164))

(declare-fun m!362237 () Bool)

(assert (=> bs!20460 m!362237))

(assert (=> b!239862 d!81164))

(declare-fun d!81166 () Bool)

(assert (=> d!81166 (validate_offset_bits!1 ((_ sign_extend 32) (size!5741 (buf!6195 (_2!11067 lt!374484)))) ((_ sign_extend 32) (currentByte!11537 thiss!982)) ((_ sign_extend 32) (currentBit!11532 thiss!982)) nBits!288)))

(declare-fun lt!374526 () Unit!17577)

(declare-fun choose!9 (BitStream!10404 array!13107 (_ BitVec 64) BitStream!10404) Unit!17577)

(assert (=> d!81166 (= lt!374526 (choose!9 thiss!982 (buf!6195 (_2!11067 lt!374484)) nBits!288 (BitStream!10405 (buf!6195 (_2!11067 lt!374484)) (currentByte!11537 thiss!982) (currentBit!11532 thiss!982))))))

(assert (=> d!81166 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6195 (_2!11067 lt!374484)) nBits!288) lt!374526)))

(declare-fun bs!20461 () Bool)

(assert (= bs!20461 d!81166))

(assert (=> bs!20461 m!362193))

(declare-fun m!362239 () Bool)

(assert (=> bs!20461 m!362239))

(assert (=> b!239862 d!81166))

(declare-fun b!239912 () Bool)

(declare-fun res!200274 () Bool)

(declare-fun e!166342 () Bool)

(assert (=> b!239912 (=> (not res!200274) (not e!166342))))

(declare-fun lt!374599 () tuple2!20288)

(assert (=> b!239912 (= res!200274 (isPrefixOf!0 (_1!11066 lt!374599) thiss!982))))

(declare-fun d!81170 () Bool)

(assert (=> d!81170 e!166342))

(declare-fun res!200273 () Bool)

(assert (=> d!81170 (=> (not res!200273) (not e!166342))))

(assert (=> d!81170 (= res!200273 (isPrefixOf!0 (_1!11066 lt!374599) (_2!11066 lt!374599)))))

(declare-fun lt!374600 () BitStream!10404)

(assert (=> d!81170 (= lt!374599 (tuple2!20289 lt!374600 (_2!11067 lt!374484)))))

(declare-fun lt!374593 () Unit!17577)

(declare-fun lt!374591 () Unit!17577)

(assert (=> d!81170 (= lt!374593 lt!374591)))

(assert (=> d!81170 (isPrefixOf!0 lt!374600 (_2!11067 lt!374484))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10404 BitStream!10404 BitStream!10404) Unit!17577)

(assert (=> d!81170 (= lt!374591 (lemmaIsPrefixTransitive!0 lt!374600 (_2!11067 lt!374484) (_2!11067 lt!374484)))))

(declare-fun lt!374604 () Unit!17577)

(declare-fun lt!374596 () Unit!17577)

(assert (=> d!81170 (= lt!374604 lt!374596)))

(assert (=> d!81170 (isPrefixOf!0 lt!374600 (_2!11067 lt!374484))))

(assert (=> d!81170 (= lt!374596 (lemmaIsPrefixTransitive!0 lt!374600 thiss!982 (_2!11067 lt!374484)))))

(declare-fun lt!374595 () Unit!17577)

(declare-fun e!166341 () Unit!17577)

(assert (=> d!81170 (= lt!374595 e!166341)))

(declare-fun c!11407 () Bool)

(assert (=> d!81170 (= c!11407 (not (= (size!5741 (buf!6195 thiss!982)) #b00000000000000000000000000000000)))))

(declare-fun lt!374605 () Unit!17577)

(declare-fun lt!374594 () Unit!17577)

(assert (=> d!81170 (= lt!374605 lt!374594)))

(assert (=> d!81170 (isPrefixOf!0 (_2!11067 lt!374484) (_2!11067 lt!374484))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10404) Unit!17577)

(assert (=> d!81170 (= lt!374594 (lemmaIsPrefixRefl!0 (_2!11067 lt!374484)))))

(declare-fun lt!374606 () Unit!17577)

(declare-fun lt!374603 () Unit!17577)

(assert (=> d!81170 (= lt!374606 lt!374603)))

(assert (=> d!81170 (= lt!374603 (lemmaIsPrefixRefl!0 (_2!11067 lt!374484)))))

(declare-fun lt!374607 () Unit!17577)

(declare-fun lt!374592 () Unit!17577)

(assert (=> d!81170 (= lt!374607 lt!374592)))

(assert (=> d!81170 (isPrefixOf!0 lt!374600 lt!374600)))

(assert (=> d!81170 (= lt!374592 (lemmaIsPrefixRefl!0 lt!374600))))

(declare-fun lt!374601 () Unit!17577)

(declare-fun lt!374597 () Unit!17577)

(assert (=> d!81170 (= lt!374601 lt!374597)))

(assert (=> d!81170 (isPrefixOf!0 thiss!982 thiss!982)))

(assert (=> d!81170 (= lt!374597 (lemmaIsPrefixRefl!0 thiss!982))))

(assert (=> d!81170 (= lt!374600 (BitStream!10405 (buf!6195 (_2!11067 lt!374484)) (currentByte!11537 thiss!982) (currentBit!11532 thiss!982)))))

(assert (=> d!81170 (isPrefixOf!0 thiss!982 (_2!11067 lt!374484))))

(assert (=> d!81170 (= (reader!0 thiss!982 (_2!11067 lt!374484)) lt!374599)))

(declare-fun b!239913 () Bool)

(declare-fun res!200275 () Bool)

(assert (=> b!239913 (=> (not res!200275) (not e!166342))))

(assert (=> b!239913 (= res!200275 (isPrefixOf!0 (_2!11066 lt!374599) (_2!11067 lt!374484)))))

(declare-fun lt!374610 () (_ BitVec 64))

(declare-fun lt!374602 () (_ BitVec 64))

(declare-fun b!239914 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10404 (_ BitVec 64)) BitStream!10404)

(assert (=> b!239914 (= e!166342 (= (_1!11066 lt!374599) (withMovedBitIndex!0 (_2!11066 lt!374599) (bvsub lt!374602 lt!374610))))))

(assert (=> b!239914 (or (= (bvand lt!374602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!374610 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!374602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!374602 lt!374610) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!239914 (= lt!374610 (bitIndex!0 (size!5741 (buf!6195 (_2!11067 lt!374484))) (currentByte!11537 (_2!11067 lt!374484)) (currentBit!11532 (_2!11067 lt!374484))))))

(assert (=> b!239914 (= lt!374602 (bitIndex!0 (size!5741 (buf!6195 thiss!982)) (currentByte!11537 thiss!982) (currentBit!11532 thiss!982)))))

(declare-fun b!239915 () Bool)

(declare-fun Unit!17583 () Unit!17577)

(assert (=> b!239915 (= e!166341 Unit!17583)))

(declare-fun b!239916 () Bool)

(declare-fun lt!374608 () Unit!17577)

(assert (=> b!239916 (= e!166341 lt!374608)))

(declare-fun lt!374609 () (_ BitVec 64))

(assert (=> b!239916 (= lt!374609 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374598 () (_ BitVec 64))

(assert (=> b!239916 (= lt!374598 (bitIndex!0 (size!5741 (buf!6195 thiss!982)) (currentByte!11537 thiss!982) (currentBit!11532 thiss!982)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13107 array!13107 (_ BitVec 64) (_ BitVec 64)) Unit!17577)

(assert (=> b!239916 (= lt!374608 (arrayBitRangesEqSymmetric!0 (buf!6195 thiss!982) (buf!6195 (_2!11067 lt!374484)) lt!374609 lt!374598))))

(declare-fun arrayBitRangesEq!0 (array!13107 array!13107 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!239916 (arrayBitRangesEq!0 (buf!6195 (_2!11067 lt!374484)) (buf!6195 thiss!982) lt!374609 lt!374598)))

(assert (= (and d!81170 c!11407) b!239916))

(assert (= (and d!81170 (not c!11407)) b!239915))

(assert (= (and d!81170 res!200273) b!239912))

(assert (= (and b!239912 res!200274) b!239913))

(assert (= (and b!239913 res!200275) b!239914))

(declare-fun m!362247 () Bool)

(assert (=> b!239913 m!362247))

(declare-fun m!362249 () Bool)

(assert (=> d!81170 m!362249))

(assert (=> d!81170 m!362199))

(declare-fun m!362251 () Bool)

(assert (=> d!81170 m!362251))

(declare-fun m!362253 () Bool)

(assert (=> d!81170 m!362253))

(declare-fun m!362255 () Bool)

(assert (=> d!81170 m!362255))

(declare-fun m!362257 () Bool)

(assert (=> d!81170 m!362257))

(declare-fun m!362259 () Bool)

(assert (=> d!81170 m!362259))

(declare-fun m!362261 () Bool)

(assert (=> d!81170 m!362261))

(declare-fun m!362263 () Bool)

(assert (=> d!81170 m!362263))

(declare-fun m!362265 () Bool)

(assert (=> d!81170 m!362265))

(declare-fun m!362267 () Bool)

(assert (=> d!81170 m!362267))

(assert (=> b!239916 m!362189))

(declare-fun m!362269 () Bool)


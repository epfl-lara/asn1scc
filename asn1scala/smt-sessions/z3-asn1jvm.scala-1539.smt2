; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42974 () Bool)

(assert start!42974)

(declare-fun b!202581 () Bool)

(declare-fun e!138888 () Bool)

(declare-fun e!138891 () Bool)

(assert (=> b!202581 (= e!138888 e!138891)))

(declare-fun res!169686 () Bool)

(assert (=> b!202581 (=> (not res!169686) (not e!138891))))

(declare-fun lt!315652 () Bool)

(declare-datatypes ((array!10291 0))(
  ( (array!10292 (arr!5459 (Array (_ BitVec 32) (_ BitVec 8))) (size!4529 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8166 0))(
  ( (BitStream!8167 (buf!5034 array!10291) (currentByte!9474 (_ BitVec 32)) (currentBit!9469 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!17334 0))(
  ( (tuple2!17335 (_1!9319 BitStream!8166) (_2!9319 Bool)) )
))
(declare-fun lt!315653 () tuple2!17334)

(declare-datatypes ((Unit!14384 0))(
  ( (Unit!14385) )
))
(declare-datatypes ((tuple2!17336 0))(
  ( (tuple2!17337 (_1!9320 Unit!14384) (_2!9320 BitStream!8166)) )
))
(declare-fun lt!315648 () tuple2!17336)

(assert (=> b!202581 (= res!169686 (and (= (_2!9319 lt!315653) lt!315652) (= (_1!9319 lt!315653) (_2!9320 lt!315648))))))

(declare-fun thiss!1204 () BitStream!8166)

(declare-fun readBitPure!0 (BitStream!8166) tuple2!17334)

(declare-fun readerFrom!0 (BitStream!8166 (_ BitVec 32) (_ BitVec 32)) BitStream!8166)

(assert (=> b!202581 (= lt!315653 (readBitPure!0 (readerFrom!0 (_2!9320 lt!315648) (currentBit!9469 thiss!1204) (currentByte!9474 thiss!1204))))))

(declare-fun b!202582 () Bool)

(declare-fun res!169685 () Bool)

(declare-fun e!138890 () Bool)

(assert (=> b!202582 (=> (not res!169685) (not e!138890))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!202582 (= res!169685 (invariant!0 (currentBit!9469 thiss!1204) (currentByte!9474 thiss!1204) (size!4529 (buf!5034 thiss!1204))))))

(declare-fun b!202583 () Bool)

(declare-fun res!169680 () Bool)

(assert (=> b!202583 (=> (not res!169680) (not e!138888))))

(declare-fun isPrefixOf!0 (BitStream!8166 BitStream!8166) Bool)

(assert (=> b!202583 (= res!169680 (isPrefixOf!0 thiss!1204 (_2!9320 lt!315648)))))

(declare-fun res!169687 () Bool)

(assert (=> start!42974 (=> (not res!169687) (not e!138890))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42974 (= res!169687 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42974 e!138890))

(assert (=> start!42974 true))

(declare-fun e!138894 () Bool)

(declare-fun inv!12 (BitStream!8166) Bool)

(assert (=> start!42974 (and (inv!12 thiss!1204) e!138894)))

(declare-fun e!138889 () Bool)

(declare-fun lt!315645 () (_ BitVec 64))

(declare-fun b!202584 () Bool)

(declare-fun lt!315647 () (_ BitVec 64))

(assert (=> b!202584 (= e!138889 (or (not (= lt!315645 (bvand ((_ sign_extend 32) nBits!348) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!315645 (bvand (bvadd lt!315647 ((_ sign_extend 32) nBits!348)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!202584 (= lt!315645 (bvand lt!315647 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!315650 () tuple2!17336)

(assert (=> b!202584 (isPrefixOf!0 thiss!1204 (_2!9320 lt!315650))))

(declare-fun lt!315646 () Unit!14384)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8166 BitStream!8166 BitStream!8166) Unit!14384)

(assert (=> b!202584 (= lt!315646 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9320 lt!315648) (_2!9320 lt!315650)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8166 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17336)

(assert (=> b!202584 (= lt!315650 (appendBitsLSBFirstLoopTR!0 (_2!9320 lt!315648) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!202585 () Bool)

(declare-fun array_inv!4270 (array!10291) Bool)

(assert (=> b!202585 (= e!138894 (array_inv!4270 (buf!5034 thiss!1204)))))

(declare-fun b!202586 () Bool)

(declare-fun e!138892 () Bool)

(assert (=> b!202586 (= e!138892 e!138888)))

(declare-fun res!169681 () Bool)

(assert (=> b!202586 (=> (not res!169681) (not e!138888))))

(declare-fun lt!315649 () (_ BitVec 64))

(declare-fun lt!315644 () (_ BitVec 64))

(assert (=> b!202586 (= res!169681 (= lt!315649 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!315644)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202586 (= lt!315649 (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315648))) (currentByte!9474 (_2!9320 lt!315648)) (currentBit!9469 (_2!9320 lt!315648))))))

(assert (=> b!202586 (= lt!315644 (bitIndex!0 (size!4529 (buf!5034 thiss!1204)) (currentByte!9474 thiss!1204) (currentBit!9469 thiss!1204)))))

(declare-fun b!202587 () Bool)

(declare-fun res!169684 () Bool)

(assert (=> b!202587 (=> (not res!169684) (not e!138890))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202587 (= res!169684 (validate_offset_bits!1 ((_ sign_extend 32) (size!4529 (buf!5034 thiss!1204))) ((_ sign_extend 32) (currentByte!9474 thiss!1204)) ((_ sign_extend 32) (currentBit!9469 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!202588 () Bool)

(assert (=> b!202588 (= e!138890 (not e!138889))))

(declare-fun res!169682 () Bool)

(assert (=> b!202588 (=> res!169682 e!138889)))

(declare-fun lt!315651 () (_ BitVec 64))

(assert (=> b!202588 (= res!169682 (not (= lt!315647 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!315651))))))

(assert (=> b!202588 (= lt!315647 (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315648))) (currentByte!9474 (_2!9320 lt!315648)) (currentBit!9469 (_2!9320 lt!315648))))))

(assert (=> b!202588 (= lt!315651 (bitIndex!0 (size!4529 (buf!5034 thiss!1204)) (currentByte!9474 thiss!1204) (currentBit!9469 thiss!1204)))))

(assert (=> b!202588 e!138892))

(declare-fun res!169683 () Bool)

(assert (=> b!202588 (=> (not res!169683) (not e!138892))))

(assert (=> b!202588 (= res!169683 (= (size!4529 (buf!5034 thiss!1204)) (size!4529 (buf!5034 (_2!9320 lt!315648)))))))

(declare-fun appendBit!0 (BitStream!8166 Bool) tuple2!17336)

(assert (=> b!202588 (= lt!315648 (appendBit!0 thiss!1204 lt!315652))))

(assert (=> b!202588 (= lt!315652 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!202589 () Bool)

(assert (=> b!202589 (= e!138891 (= (bitIndex!0 (size!4529 (buf!5034 (_1!9319 lt!315653))) (currentByte!9474 (_1!9319 lt!315653)) (currentBit!9469 (_1!9319 lt!315653))) lt!315649))))

(declare-fun b!202590 () Bool)

(declare-fun res!169688 () Bool)

(assert (=> b!202590 (=> (not res!169688) (not e!138890))))

(assert (=> b!202590 (= res!169688 (not (= i!590 nBits!348)))))

(assert (= (and start!42974 res!169687) b!202587))

(assert (= (and b!202587 res!169684) b!202582))

(assert (= (and b!202582 res!169685) b!202590))

(assert (= (and b!202590 res!169688) b!202588))

(assert (= (and b!202588 res!169683) b!202586))

(assert (= (and b!202586 res!169681) b!202583))

(assert (= (and b!202583 res!169680) b!202581))

(assert (= (and b!202581 res!169686) b!202589))

(assert (= (and b!202588 (not res!169682)) b!202584))

(assert (= start!42974 b!202585))

(declare-fun m!313129 () Bool)

(assert (=> b!202585 m!313129))

(declare-fun m!313131 () Bool)

(assert (=> b!202587 m!313131))

(declare-fun m!313133 () Bool)

(assert (=> b!202586 m!313133))

(declare-fun m!313135 () Bool)

(assert (=> b!202586 m!313135))

(declare-fun m!313137 () Bool)

(assert (=> b!202589 m!313137))

(declare-fun m!313139 () Bool)

(assert (=> b!202581 m!313139))

(assert (=> b!202581 m!313139))

(declare-fun m!313141 () Bool)

(assert (=> b!202581 m!313141))

(assert (=> b!202588 m!313133))

(assert (=> b!202588 m!313135))

(declare-fun m!313143 () Bool)

(assert (=> b!202588 m!313143))

(declare-fun m!313145 () Bool)

(assert (=> b!202583 m!313145))

(declare-fun m!313147 () Bool)

(assert (=> b!202584 m!313147))

(declare-fun m!313149 () Bool)

(assert (=> b!202584 m!313149))

(declare-fun m!313151 () Bool)

(assert (=> b!202584 m!313151))

(declare-fun m!313153 () Bool)

(assert (=> start!42974 m!313153))

(declare-fun m!313155 () Bool)

(assert (=> b!202582 m!313155))

(check-sat (not b!202582) (not b!202585) (not start!42974) (not b!202583) (not b!202588) (not b!202584) (not b!202587) (not b!202586) (not b!202589) (not b!202581))
(check-sat)
(get-model)

(declare-fun d!69289 () Bool)

(assert (=> d!69289 (= (array_inv!4270 (buf!5034 thiss!1204)) (bvsge (size!4529 (buf!5034 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!202585 d!69289))

(declare-fun d!69291 () Bool)

(declare-fun e!138918 () Bool)

(assert (=> d!69291 e!138918))

(declare-fun res!169721 () Bool)

(assert (=> d!69291 (=> (not res!169721) (not e!138918))))

(declare-fun lt!315699 () (_ BitVec 64))

(declare-fun lt!315697 () (_ BitVec 64))

(declare-fun lt!315698 () (_ BitVec 64))

(assert (=> d!69291 (= res!169721 (= lt!315699 (bvsub lt!315697 lt!315698)))))

(assert (=> d!69291 (or (= (bvand lt!315697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315698 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315697 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315697 lt!315698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69291 (= lt!315698 (remainingBits!0 ((_ sign_extend 32) (size!4529 (buf!5034 (_2!9320 lt!315648)))) ((_ sign_extend 32) (currentByte!9474 (_2!9320 lt!315648))) ((_ sign_extend 32) (currentBit!9469 (_2!9320 lt!315648)))))))

(declare-fun lt!315696 () (_ BitVec 64))

(declare-fun lt!315700 () (_ BitVec 64))

(assert (=> d!69291 (= lt!315697 (bvmul lt!315696 lt!315700))))

(assert (=> d!69291 (or (= lt!315696 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315700 (bvsdiv (bvmul lt!315696 lt!315700) lt!315696)))))

(assert (=> d!69291 (= lt!315700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69291 (= lt!315696 ((_ sign_extend 32) (size!4529 (buf!5034 (_2!9320 lt!315648)))))))

(assert (=> d!69291 (= lt!315699 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9474 (_2!9320 lt!315648))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9469 (_2!9320 lt!315648)))))))

(assert (=> d!69291 (invariant!0 (currentBit!9469 (_2!9320 lt!315648)) (currentByte!9474 (_2!9320 lt!315648)) (size!4529 (buf!5034 (_2!9320 lt!315648))))))

(assert (=> d!69291 (= (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315648))) (currentByte!9474 (_2!9320 lt!315648)) (currentBit!9469 (_2!9320 lt!315648))) lt!315699)))

(declare-fun b!202625 () Bool)

(declare-fun res!169720 () Bool)

(assert (=> b!202625 (=> (not res!169720) (not e!138918))))

(assert (=> b!202625 (= res!169720 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315699))))

(declare-fun b!202626 () Bool)

(declare-fun lt!315701 () (_ BitVec 64))

(assert (=> b!202626 (= e!138918 (bvsle lt!315699 (bvmul lt!315701 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202626 (or (= lt!315701 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315701 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315701)))))

(assert (=> b!202626 (= lt!315701 ((_ sign_extend 32) (size!4529 (buf!5034 (_2!9320 lt!315648)))))))

(assert (= (and d!69291 res!169721) b!202625))

(assert (= (and b!202625 res!169720) b!202626))

(declare-fun m!313185 () Bool)

(assert (=> d!69291 m!313185))

(declare-fun m!313187 () Bool)

(assert (=> d!69291 m!313187))

(assert (=> b!202586 d!69291))

(declare-fun d!69293 () Bool)

(declare-fun e!138919 () Bool)

(assert (=> d!69293 e!138919))

(declare-fun res!169723 () Bool)

(assert (=> d!69293 (=> (not res!169723) (not e!138919))))

(declare-fun lt!315704 () (_ BitVec 64))

(declare-fun lt!315705 () (_ BitVec 64))

(declare-fun lt!315703 () (_ BitVec 64))

(assert (=> d!69293 (= res!169723 (= lt!315705 (bvsub lt!315703 lt!315704)))))

(assert (=> d!69293 (or (= (bvand lt!315703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315703 lt!315704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69293 (= lt!315704 (remainingBits!0 ((_ sign_extend 32) (size!4529 (buf!5034 thiss!1204))) ((_ sign_extend 32) (currentByte!9474 thiss!1204)) ((_ sign_extend 32) (currentBit!9469 thiss!1204))))))

(declare-fun lt!315702 () (_ BitVec 64))

(declare-fun lt!315706 () (_ BitVec 64))

(assert (=> d!69293 (= lt!315703 (bvmul lt!315702 lt!315706))))

(assert (=> d!69293 (or (= lt!315702 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315706 (bvsdiv (bvmul lt!315702 lt!315706) lt!315702)))))

(assert (=> d!69293 (= lt!315706 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69293 (= lt!315702 ((_ sign_extend 32) (size!4529 (buf!5034 thiss!1204))))))

(assert (=> d!69293 (= lt!315705 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9474 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9469 thiss!1204))))))

(assert (=> d!69293 (invariant!0 (currentBit!9469 thiss!1204) (currentByte!9474 thiss!1204) (size!4529 (buf!5034 thiss!1204)))))

(assert (=> d!69293 (= (bitIndex!0 (size!4529 (buf!5034 thiss!1204)) (currentByte!9474 thiss!1204) (currentBit!9469 thiss!1204)) lt!315705)))

(declare-fun b!202627 () Bool)

(declare-fun res!169722 () Bool)

(assert (=> b!202627 (=> (not res!169722) (not e!138919))))

(assert (=> b!202627 (= res!169722 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315705))))

(declare-fun b!202628 () Bool)

(declare-fun lt!315707 () (_ BitVec 64))

(assert (=> b!202628 (= e!138919 (bvsle lt!315705 (bvmul lt!315707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202628 (or (= lt!315707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315707)))))

(assert (=> b!202628 (= lt!315707 ((_ sign_extend 32) (size!4529 (buf!5034 thiss!1204))))))

(assert (= (and d!69293 res!169723) b!202627))

(assert (= (and b!202627 res!169722) b!202628))

(declare-fun m!313189 () Bool)

(assert (=> d!69293 m!313189))

(assert (=> d!69293 m!313155))

(assert (=> b!202586 d!69293))

(declare-fun d!69295 () Bool)

(declare-datatypes ((tuple2!17342 0))(
  ( (tuple2!17343 (_1!9323 Bool) (_2!9323 BitStream!8166)) )
))
(declare-fun lt!315710 () tuple2!17342)

(declare-fun readBit!0 (BitStream!8166) tuple2!17342)

(assert (=> d!69295 (= lt!315710 (readBit!0 (readerFrom!0 (_2!9320 lt!315648) (currentBit!9469 thiss!1204) (currentByte!9474 thiss!1204))))))

(assert (=> d!69295 (= (readBitPure!0 (readerFrom!0 (_2!9320 lt!315648) (currentBit!9469 thiss!1204) (currentByte!9474 thiss!1204))) (tuple2!17335 (_2!9323 lt!315710) (_1!9323 lt!315710)))))

(declare-fun bs!17094 () Bool)

(assert (= bs!17094 d!69295))

(assert (=> bs!17094 m!313139))

(declare-fun m!313191 () Bool)

(assert (=> bs!17094 m!313191))

(assert (=> b!202581 d!69295))

(declare-fun d!69297 () Bool)

(declare-fun e!138922 () Bool)

(assert (=> d!69297 e!138922))

(declare-fun res!169727 () Bool)

(assert (=> d!69297 (=> (not res!169727) (not e!138922))))

(assert (=> d!69297 (= res!169727 (invariant!0 (currentBit!9469 (_2!9320 lt!315648)) (currentByte!9474 (_2!9320 lt!315648)) (size!4529 (buf!5034 (_2!9320 lt!315648)))))))

(assert (=> d!69297 (= (readerFrom!0 (_2!9320 lt!315648) (currentBit!9469 thiss!1204) (currentByte!9474 thiss!1204)) (BitStream!8167 (buf!5034 (_2!9320 lt!315648)) (currentByte!9474 thiss!1204) (currentBit!9469 thiss!1204)))))

(declare-fun b!202631 () Bool)

(assert (=> b!202631 (= e!138922 (invariant!0 (currentBit!9469 thiss!1204) (currentByte!9474 thiss!1204) (size!4529 (buf!5034 (_2!9320 lt!315648)))))))

(assert (= (and d!69297 res!169727) b!202631))

(assert (=> d!69297 m!313187))

(declare-fun m!313193 () Bool)

(assert (=> b!202631 m!313193))

(assert (=> b!202581 d!69297))

(declare-fun d!69299 () Bool)

(assert (=> d!69299 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4529 (buf!5034 thiss!1204))) ((_ sign_extend 32) (currentByte!9474 thiss!1204)) ((_ sign_extend 32) (currentBit!9469 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4529 (buf!5034 thiss!1204))) ((_ sign_extend 32) (currentByte!9474 thiss!1204)) ((_ sign_extend 32) (currentBit!9469 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17095 () Bool)

(assert (= bs!17095 d!69299))

(assert (=> bs!17095 m!313189))

(assert (=> b!202587 d!69299))

(declare-fun d!69301 () Bool)

(assert (=> d!69301 (= (invariant!0 (currentBit!9469 thiss!1204) (currentByte!9474 thiss!1204) (size!4529 (buf!5034 thiss!1204))) (and (bvsge (currentBit!9469 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9469 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9474 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9474 thiss!1204) (size!4529 (buf!5034 thiss!1204))) (and (= (currentBit!9469 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9474 thiss!1204) (size!4529 (buf!5034 thiss!1204)))))))))

(assert (=> b!202582 d!69301))

(assert (=> b!202588 d!69291))

(assert (=> b!202588 d!69293))

(declare-fun d!69303 () Bool)

(declare-fun e!138933 () Bool)

(assert (=> d!69303 e!138933))

(declare-fun res!169745 () Bool)

(assert (=> d!69303 (=> (not res!169745) (not e!138933))))

(declare-fun lt!315734 () tuple2!17336)

(assert (=> d!69303 (= res!169745 (= (size!4529 (buf!5034 thiss!1204)) (size!4529 (buf!5034 (_2!9320 lt!315734)))))))

(declare-fun choose!16 (BitStream!8166 Bool) tuple2!17336)

(assert (=> d!69303 (= lt!315734 (choose!16 thiss!1204 lt!315652))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69303 (validate_offset_bit!0 ((_ sign_extend 32) (size!4529 (buf!5034 thiss!1204))) ((_ sign_extend 32) (currentByte!9474 thiss!1204)) ((_ sign_extend 32) (currentBit!9469 thiss!1204)))))

(assert (=> d!69303 (= (appendBit!0 thiss!1204 lt!315652) lt!315734)))

(declare-fun b!202649 () Bool)

(declare-fun res!169746 () Bool)

(assert (=> b!202649 (=> (not res!169746) (not e!138933))))

(assert (=> b!202649 (= res!169746 (isPrefixOf!0 thiss!1204 (_2!9320 lt!315734)))))

(declare-fun b!202648 () Bool)

(declare-fun res!169744 () Bool)

(assert (=> b!202648 (=> (not res!169744) (not e!138933))))

(declare-fun lt!315736 () (_ BitVec 64))

(declare-fun lt!315735 () (_ BitVec 64))

(assert (=> b!202648 (= res!169744 (= (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315734))) (currentByte!9474 (_2!9320 lt!315734)) (currentBit!9469 (_2!9320 lt!315734))) (bvadd lt!315736 lt!315735)))))

(assert (=> b!202648 (or (not (= (bvand lt!315736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315735 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!315736 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!315736 lt!315735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202648 (= lt!315735 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!202648 (= lt!315736 (bitIndex!0 (size!4529 (buf!5034 thiss!1204)) (currentByte!9474 thiss!1204) (currentBit!9469 thiss!1204)))))

(declare-fun b!202650 () Bool)

(declare-fun e!138932 () Bool)

(assert (=> b!202650 (= e!138933 e!138932)))

(declare-fun res!169747 () Bool)

(assert (=> b!202650 (=> (not res!169747) (not e!138932))))

(declare-fun lt!315737 () tuple2!17334)

(assert (=> b!202650 (= res!169747 (and (= (_2!9319 lt!315737) lt!315652) (= (_1!9319 lt!315737) (_2!9320 lt!315734))))))

(assert (=> b!202650 (= lt!315737 (readBitPure!0 (readerFrom!0 (_2!9320 lt!315734) (currentBit!9469 thiss!1204) (currentByte!9474 thiss!1204))))))

(declare-fun b!202651 () Bool)

(assert (=> b!202651 (= e!138932 (= (bitIndex!0 (size!4529 (buf!5034 (_1!9319 lt!315737))) (currentByte!9474 (_1!9319 lt!315737)) (currentBit!9469 (_1!9319 lt!315737))) (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315734))) (currentByte!9474 (_2!9320 lt!315734)) (currentBit!9469 (_2!9320 lt!315734)))))))

(assert (= (and d!69303 res!169745) b!202648))

(assert (= (and b!202648 res!169744) b!202649))

(assert (= (and b!202649 res!169746) b!202650))

(assert (= (and b!202650 res!169747) b!202651))

(declare-fun m!313203 () Bool)

(assert (=> b!202650 m!313203))

(assert (=> b!202650 m!313203))

(declare-fun m!313205 () Bool)

(assert (=> b!202650 m!313205))

(declare-fun m!313209 () Bool)

(assert (=> d!69303 m!313209))

(declare-fun m!313213 () Bool)

(assert (=> d!69303 m!313213))

(declare-fun m!313215 () Bool)

(assert (=> b!202648 m!313215))

(assert (=> b!202648 m!313135))

(declare-fun m!313217 () Bool)

(assert (=> b!202649 m!313217))

(declare-fun m!313219 () Bool)

(assert (=> b!202651 m!313219))

(assert (=> b!202651 m!313215))

(assert (=> b!202588 d!69303))

(declare-fun d!69317 () Bool)

(declare-fun res!169764 () Bool)

(declare-fun e!138944 () Bool)

(assert (=> d!69317 (=> (not res!169764) (not e!138944))))

(assert (=> d!69317 (= res!169764 (= (size!4529 (buf!5034 thiss!1204)) (size!4529 (buf!5034 (_2!9320 lt!315648)))))))

(assert (=> d!69317 (= (isPrefixOf!0 thiss!1204 (_2!9320 lt!315648)) e!138944)))

(declare-fun b!202666 () Bool)

(declare-fun res!169762 () Bool)

(assert (=> b!202666 (=> (not res!169762) (not e!138944))))

(assert (=> b!202666 (= res!169762 (bvsle (bitIndex!0 (size!4529 (buf!5034 thiss!1204)) (currentByte!9474 thiss!1204) (currentBit!9469 thiss!1204)) (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315648))) (currentByte!9474 (_2!9320 lt!315648)) (currentBit!9469 (_2!9320 lt!315648)))))))

(declare-fun b!202667 () Bool)

(declare-fun e!138943 () Bool)

(assert (=> b!202667 (= e!138944 e!138943)))

(declare-fun res!169763 () Bool)

(assert (=> b!202667 (=> res!169763 e!138943)))

(assert (=> b!202667 (= res!169763 (= (size!4529 (buf!5034 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202668 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10291 array!10291 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!202668 (= e!138943 (arrayBitRangesEq!0 (buf!5034 thiss!1204) (buf!5034 (_2!9320 lt!315648)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4529 (buf!5034 thiss!1204)) (currentByte!9474 thiss!1204) (currentBit!9469 thiss!1204))))))

(assert (= (and d!69317 res!169764) b!202666))

(assert (= (and b!202666 res!169762) b!202667))

(assert (= (and b!202667 (not res!169763)) b!202668))

(assert (=> b!202666 m!313135))

(assert (=> b!202666 m!313133))

(assert (=> b!202668 m!313135))

(assert (=> b!202668 m!313135))

(declare-fun m!313221 () Bool)

(assert (=> b!202668 m!313221))

(assert (=> b!202583 d!69317))

(declare-fun d!69321 () Bool)

(assert (=> d!69321 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9469 thiss!1204) (currentByte!9474 thiss!1204) (size!4529 (buf!5034 thiss!1204))))))

(declare-fun bs!17099 () Bool)

(assert (= bs!17099 d!69321))

(assert (=> bs!17099 m!313155))

(assert (=> start!42974 d!69321))

(declare-fun d!69325 () Bool)

(declare-fun e!138947 () Bool)

(assert (=> d!69325 e!138947))

(declare-fun res!169769 () Bool)

(assert (=> d!69325 (=> (not res!169769) (not e!138947))))

(declare-fun lt!315745 () (_ BitVec 64))

(declare-fun lt!315746 () (_ BitVec 64))

(declare-fun lt!315747 () (_ BitVec 64))

(assert (=> d!69325 (= res!169769 (= lt!315747 (bvsub lt!315745 lt!315746)))))

(assert (=> d!69325 (or (= (bvand lt!315745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!315746 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!315745 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!315745 lt!315746) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69325 (= lt!315746 (remainingBits!0 ((_ sign_extend 32) (size!4529 (buf!5034 (_1!9319 lt!315653)))) ((_ sign_extend 32) (currentByte!9474 (_1!9319 lt!315653))) ((_ sign_extend 32) (currentBit!9469 (_1!9319 lt!315653)))))))

(declare-fun lt!315744 () (_ BitVec 64))

(declare-fun lt!315748 () (_ BitVec 64))

(assert (=> d!69325 (= lt!315745 (bvmul lt!315744 lt!315748))))

(assert (=> d!69325 (or (= lt!315744 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!315748 (bvsdiv (bvmul lt!315744 lt!315748) lt!315744)))))

(assert (=> d!69325 (= lt!315748 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69325 (= lt!315744 ((_ sign_extend 32) (size!4529 (buf!5034 (_1!9319 lt!315653)))))))

(assert (=> d!69325 (= lt!315747 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9474 (_1!9319 lt!315653))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9469 (_1!9319 lt!315653)))))))

(assert (=> d!69325 (invariant!0 (currentBit!9469 (_1!9319 lt!315653)) (currentByte!9474 (_1!9319 lt!315653)) (size!4529 (buf!5034 (_1!9319 lt!315653))))))

(assert (=> d!69325 (= (bitIndex!0 (size!4529 (buf!5034 (_1!9319 lt!315653))) (currentByte!9474 (_1!9319 lt!315653)) (currentBit!9469 (_1!9319 lt!315653))) lt!315747)))

(declare-fun b!202672 () Bool)

(declare-fun res!169768 () Bool)

(assert (=> b!202672 (=> (not res!169768) (not e!138947))))

(assert (=> b!202672 (= res!169768 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!315747))))

(declare-fun b!202673 () Bool)

(declare-fun lt!315749 () (_ BitVec 64))

(assert (=> b!202673 (= e!138947 (bvsle lt!315747 (bvmul lt!315749 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!202673 (or (= lt!315749 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!315749 #b0000000000000000000000000000000000000000000000000000000000001000) lt!315749)))))

(assert (=> b!202673 (= lt!315749 ((_ sign_extend 32) (size!4529 (buf!5034 (_1!9319 lt!315653)))))))

(assert (= (and d!69325 res!169769) b!202672))

(assert (= (and b!202672 res!169768) b!202673))

(declare-fun m!313227 () Bool)

(assert (=> d!69325 m!313227))

(declare-fun m!313229 () Bool)

(assert (=> d!69325 m!313229))

(assert (=> b!202589 d!69325))

(declare-fun d!69327 () Bool)

(declare-fun res!169772 () Bool)

(declare-fun e!138949 () Bool)

(assert (=> d!69327 (=> (not res!169772) (not e!138949))))

(assert (=> d!69327 (= res!169772 (= (size!4529 (buf!5034 thiss!1204)) (size!4529 (buf!5034 (_2!9320 lt!315650)))))))

(assert (=> d!69327 (= (isPrefixOf!0 thiss!1204 (_2!9320 lt!315650)) e!138949)))

(declare-fun b!202674 () Bool)

(declare-fun res!169770 () Bool)

(assert (=> b!202674 (=> (not res!169770) (not e!138949))))

(assert (=> b!202674 (= res!169770 (bvsle (bitIndex!0 (size!4529 (buf!5034 thiss!1204)) (currentByte!9474 thiss!1204) (currentBit!9469 thiss!1204)) (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315650))) (currentByte!9474 (_2!9320 lt!315650)) (currentBit!9469 (_2!9320 lt!315650)))))))

(declare-fun b!202675 () Bool)

(declare-fun e!138948 () Bool)

(assert (=> b!202675 (= e!138949 e!138948)))

(declare-fun res!169771 () Bool)

(assert (=> b!202675 (=> res!169771 e!138948)))

(assert (=> b!202675 (= res!169771 (= (size!4529 (buf!5034 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!202676 () Bool)

(assert (=> b!202676 (= e!138948 (arrayBitRangesEq!0 (buf!5034 thiss!1204) (buf!5034 (_2!9320 lt!315650)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4529 (buf!5034 thiss!1204)) (currentByte!9474 thiss!1204) (currentBit!9469 thiss!1204))))))

(assert (= (and d!69327 res!169772) b!202674))

(assert (= (and b!202674 res!169770) b!202675))

(assert (= (and b!202675 (not res!169771)) b!202676))

(assert (=> b!202674 m!313135))

(declare-fun m!313231 () Bool)

(assert (=> b!202674 m!313231))

(assert (=> b!202676 m!313135))

(assert (=> b!202676 m!313135))

(declare-fun m!313233 () Bool)

(assert (=> b!202676 m!313233))

(assert (=> b!202584 d!69327))

(declare-fun d!69329 () Bool)

(assert (=> d!69329 (isPrefixOf!0 thiss!1204 (_2!9320 lt!315650))))

(declare-fun lt!315767 () Unit!14384)

(declare-fun choose!30 (BitStream!8166 BitStream!8166 BitStream!8166) Unit!14384)

(assert (=> d!69329 (= lt!315767 (choose!30 thiss!1204 (_2!9320 lt!315648) (_2!9320 lt!315650)))))

(assert (=> d!69329 (isPrefixOf!0 thiss!1204 (_2!9320 lt!315648))))

(assert (=> d!69329 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9320 lt!315648) (_2!9320 lt!315650)) lt!315767)))

(declare-fun bs!17101 () Bool)

(assert (= bs!17101 d!69329))

(assert (=> bs!17101 m!313147))

(declare-fun m!313237 () Bool)

(assert (=> bs!17101 m!313237))

(assert (=> bs!17101 m!313145))

(assert (=> b!202584 d!69329))

(declare-fun b!202777 () Bool)

(declare-fun e!139016 () Bool)

(declare-datatypes ((tuple2!17346 0))(
  ( (tuple2!17347 (_1!9325 BitStream!8166) (_2!9325 (_ BitVec 64))) )
))
(declare-fun lt!316049 () tuple2!17346)

(declare-datatypes ((tuple2!17348 0))(
  ( (tuple2!17349 (_1!9326 BitStream!8166) (_2!9326 BitStream!8166)) )
))
(declare-fun lt!316067 () tuple2!17348)

(assert (=> b!202777 (= e!139016 (= (_1!9325 lt!316049) (_2!9326 lt!316067)))))

(declare-fun lt!316036 () tuple2!17336)

(declare-fun call!3195 () Bool)

(declare-fun c!10052 () Bool)

(declare-fun bm!3191 () Bool)

(assert (=> bm!3191 (= call!3195 (isPrefixOf!0 (_2!9320 lt!315648) (ite c!10052 (_2!9320 lt!315648) (_2!9320 lt!316036))))))

(declare-fun b!202780 () Bool)

(declare-fun e!139020 () tuple2!17336)

(declare-fun Unit!14388 () Unit!14384)

(assert (=> b!202780 (= e!139020 (tuple2!17337 Unit!14388 (_2!9320 lt!315648)))))

(declare-fun lt!316129 () Unit!14384)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8166) Unit!14384)

(assert (=> b!202780 (= lt!316129 (lemmaIsPrefixRefl!0 (_2!9320 lt!315648)))))

(assert (=> b!202780 call!3195))

(declare-fun lt!316046 () Unit!14384)

(assert (=> b!202780 (= lt!316046 lt!316129)))

(declare-fun b!202782 () Bool)

(assert (=> b!202782 (= e!139020 (tuple2!17337 (_1!9320 lt!316036) (_2!9320 lt!316036)))))

(declare-fun lt!316115 () Bool)

(assert (=> b!202782 (= lt!316115 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!316116 () tuple2!17336)

(assert (=> b!202782 (= lt!316116 (appendBit!0 (_2!9320 lt!315648) lt!316115))))

(declare-fun res!169871 () Bool)

(assert (=> b!202782 (= res!169871 (= (size!4529 (buf!5034 (_2!9320 lt!315648))) (size!4529 (buf!5034 (_2!9320 lt!316116)))))))

(declare-fun e!139008 () Bool)

(assert (=> b!202782 (=> (not res!169871) (not e!139008))))

(assert (=> b!202782 e!139008))

(declare-fun lt!316050 () tuple2!17336)

(assert (=> b!202782 (= lt!316050 lt!316116)))

(assert (=> b!202782 (= lt!316036 (appendBitsLSBFirstLoopTR!0 (_2!9320 lt!316050) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!316125 () Unit!14384)

(assert (=> b!202782 (= lt!316125 (lemmaIsPrefixTransitive!0 (_2!9320 lt!315648) (_2!9320 lt!316050) (_2!9320 lt!316036)))))

(assert (=> b!202782 call!3195))

(declare-fun lt!316043 () Unit!14384)

(assert (=> b!202782 (= lt!316043 lt!316125)))

(assert (=> b!202782 (invariant!0 (currentBit!9469 (_2!9320 lt!315648)) (currentByte!9474 (_2!9320 lt!315648)) (size!4529 (buf!5034 (_2!9320 lt!316050))))))

(declare-fun lt!316109 () BitStream!8166)

(assert (=> b!202782 (= lt!316109 (BitStream!8167 (buf!5034 (_2!9320 lt!316050)) (currentByte!9474 (_2!9320 lt!315648)) (currentBit!9469 (_2!9320 lt!315648))))))

(assert (=> b!202782 (invariant!0 (currentBit!9469 lt!316109) (currentByte!9474 lt!316109) (size!4529 (buf!5034 (_2!9320 lt!316036))))))

(declare-fun lt!316119 () BitStream!8166)

(assert (=> b!202782 (= lt!316119 (BitStream!8167 (buf!5034 (_2!9320 lt!316036)) (currentByte!9474 lt!316109) (currentBit!9469 lt!316109)))))

(declare-fun lt!316123 () tuple2!17334)

(assert (=> b!202782 (= lt!316123 (readBitPure!0 lt!316109))))

(declare-fun lt!316091 () tuple2!17334)

(assert (=> b!202782 (= lt!316091 (readBitPure!0 lt!316119))))

(declare-fun lt!316139 () Unit!14384)

(declare-fun readBitPrefixLemma!0 (BitStream!8166 BitStream!8166) Unit!14384)

(assert (=> b!202782 (= lt!316139 (readBitPrefixLemma!0 lt!316109 (_2!9320 lt!316036)))))

(declare-fun res!169868 () Bool)

(assert (=> b!202782 (= res!169868 (= (bitIndex!0 (size!4529 (buf!5034 (_1!9319 lt!316123))) (currentByte!9474 (_1!9319 lt!316123)) (currentBit!9469 (_1!9319 lt!316123))) (bitIndex!0 (size!4529 (buf!5034 (_1!9319 lt!316091))) (currentByte!9474 (_1!9319 lt!316091)) (currentBit!9469 (_1!9319 lt!316091)))))))

(declare-fun e!139007 () Bool)

(assert (=> b!202782 (=> (not res!169868) (not e!139007))))

(assert (=> b!202782 e!139007))

(declare-fun lt!316096 () Unit!14384)

(assert (=> b!202782 (= lt!316096 lt!316139)))

(declare-fun lt!316039 () tuple2!17348)

(declare-fun reader!0 (BitStream!8166 BitStream!8166) tuple2!17348)

(assert (=> b!202782 (= lt!316039 (reader!0 (_2!9320 lt!315648) (_2!9320 lt!316036)))))

(declare-fun lt!316073 () tuple2!17348)

(assert (=> b!202782 (= lt!316073 (reader!0 (_2!9320 lt!316050) (_2!9320 lt!316036)))))

(declare-fun lt!316088 () tuple2!17334)

(assert (=> b!202782 (= lt!316088 (readBitPure!0 (_1!9326 lt!316039)))))

(assert (=> b!202782 (= (_2!9319 lt!316088) lt!316115)))

(declare-fun lt!316106 () Unit!14384)

(declare-fun Unit!14389 () Unit!14384)

(assert (=> b!202782 (= lt!316106 Unit!14389)))

(declare-fun lt!316064 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!202782 (= lt!316064 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316071 () (_ BitVec 64))

(assert (=> b!202782 (= lt!316071 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316034 () Unit!14384)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8166 array!10291 (_ BitVec 64)) Unit!14384)

(assert (=> b!202782 (= lt!316034 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9320 lt!315648) (buf!5034 (_2!9320 lt!316036)) lt!316071))))

(assert (=> b!202782 (validate_offset_bits!1 ((_ sign_extend 32) (size!4529 (buf!5034 (_2!9320 lt!316036)))) ((_ sign_extend 32) (currentByte!9474 (_2!9320 lt!315648))) ((_ sign_extend 32) (currentBit!9469 (_2!9320 lt!315648))) lt!316071)))

(declare-fun lt!316029 () Unit!14384)

(assert (=> b!202782 (= lt!316029 lt!316034)))

(declare-fun lt!316134 () tuple2!17346)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17346)

(assert (=> b!202782 (= lt!316134 (readNBitsLSBFirstsLoopPure!0 (_1!9326 lt!316039) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316064))))

(declare-fun lt!316056 () (_ BitVec 64))

(assert (=> b!202782 (= lt!316056 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!316085 () Unit!14384)

(assert (=> b!202782 (= lt!316085 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9320 lt!316050) (buf!5034 (_2!9320 lt!316036)) lt!316056))))

(assert (=> b!202782 (validate_offset_bits!1 ((_ sign_extend 32) (size!4529 (buf!5034 (_2!9320 lt!316036)))) ((_ sign_extend 32) (currentByte!9474 (_2!9320 lt!316050))) ((_ sign_extend 32) (currentBit!9469 (_2!9320 lt!316050))) lt!316056)))

(declare-fun lt!316100 () Unit!14384)

(assert (=> b!202782 (= lt!316100 lt!316085)))

(declare-fun lt!316069 () tuple2!17346)

(assert (=> b!202782 (= lt!316069 (readNBitsLSBFirstsLoopPure!0 (_1!9326 lt!316073) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!316064 (ite (_2!9319 lt!316088) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!316113 () tuple2!17346)

(assert (=> b!202782 (= lt!316113 (readNBitsLSBFirstsLoopPure!0 (_1!9326 lt!316039) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316064))))

(declare-fun c!10054 () Bool)

(assert (=> b!202782 (= c!10054 (_2!9319 (readBitPure!0 (_1!9326 lt!316039))))))

(declare-fun e!139013 () (_ BitVec 64))

(declare-fun lt!316083 () tuple2!17346)

(declare-fun withMovedBitIndex!0 (BitStream!8166 (_ BitVec 64)) BitStream!8166)

(assert (=> b!202782 (= lt!316083 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9326 lt!316039) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!316064 e!139013)))))

(declare-fun lt!316082 () Unit!14384)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8166 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14384)

(assert (=> b!202782 (= lt!316082 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9326 lt!316039) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!316064))))

(assert (=> b!202782 (and (= (_2!9325 lt!316113) (_2!9325 lt!316083)) (= (_1!9325 lt!316113) (_1!9325 lt!316083)))))

(declare-fun lt!316108 () Unit!14384)

(assert (=> b!202782 (= lt!316108 lt!316082)))

(assert (=> b!202782 (= (_1!9326 lt!316039) (withMovedBitIndex!0 (_2!9326 lt!316039) (bvsub (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315648))) (currentByte!9474 (_2!9320 lt!315648)) (currentBit!9469 (_2!9320 lt!315648))) (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!316036))) (currentByte!9474 (_2!9320 lt!316036)) (currentBit!9469 (_2!9320 lt!316036))))))))

(declare-fun lt!316053 () Unit!14384)

(declare-fun Unit!14391 () Unit!14384)

(assert (=> b!202782 (= lt!316053 Unit!14391)))

(assert (=> b!202782 (= (_1!9326 lt!316073) (withMovedBitIndex!0 (_2!9326 lt!316073) (bvsub (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!316050))) (currentByte!9474 (_2!9320 lt!316050)) (currentBit!9469 (_2!9320 lt!316050))) (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!316036))) (currentByte!9474 (_2!9320 lt!316036)) (currentBit!9469 (_2!9320 lt!316036))))))))

(declare-fun lt!316126 () Unit!14384)

(declare-fun Unit!14392 () Unit!14384)

(assert (=> b!202782 (= lt!316126 Unit!14392)))

(assert (=> b!202782 (= (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315648))) (currentByte!9474 (_2!9320 lt!315648)) (currentBit!9469 (_2!9320 lt!315648))) (bvsub (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!316050))) (currentByte!9474 (_2!9320 lt!316050)) (currentBit!9469 (_2!9320 lt!316050))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!316057 () Unit!14384)

(declare-fun Unit!14393 () Unit!14384)

(assert (=> b!202782 (= lt!316057 Unit!14393)))

(assert (=> b!202782 (= (_2!9325 lt!316134) (_2!9325 lt!316069))))

(declare-fun lt!316076 () Unit!14384)

(declare-fun Unit!14394 () Unit!14384)

(assert (=> b!202782 (= lt!316076 Unit!14394)))

(assert (=> b!202782 (invariant!0 (currentBit!9469 (_2!9320 lt!316036)) (currentByte!9474 (_2!9320 lt!316036)) (size!4529 (buf!5034 (_2!9320 lt!316036))))))

(declare-fun lt!316074 () Unit!14384)

(declare-fun Unit!14395 () Unit!14384)

(assert (=> b!202782 (= lt!316074 Unit!14395)))

(assert (=> b!202782 (= (size!4529 (buf!5034 (_2!9320 lt!315648))) (size!4529 (buf!5034 (_2!9320 lt!316036))))))

(declare-fun lt!316060 () Unit!14384)

(declare-fun Unit!14396 () Unit!14384)

(assert (=> b!202782 (= lt!316060 Unit!14396)))

(assert (=> b!202782 (= (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!316036))) (currentByte!9474 (_2!9320 lt!316036)) (currentBit!9469 (_2!9320 lt!316036))) (bvsub (bvadd (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315648))) (currentByte!9474 (_2!9320 lt!315648)) (currentBit!9469 (_2!9320 lt!315648))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316098 () Unit!14384)

(declare-fun Unit!14397 () Unit!14384)

(assert (=> b!202782 (= lt!316098 Unit!14397)))

(declare-fun lt!316105 () Unit!14384)

(declare-fun Unit!14398 () Unit!14384)

(assert (=> b!202782 (= lt!316105 Unit!14398)))

(declare-fun lt!316062 () tuple2!17348)

(assert (=> b!202782 (= lt!316062 (reader!0 (_2!9320 lt!315648) (_2!9320 lt!316036)))))

(declare-fun lt!316032 () (_ BitVec 64))

(assert (=> b!202782 (= lt!316032 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!316041 () Unit!14384)

(assert (=> b!202782 (= lt!316041 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9320 lt!315648) (buf!5034 (_2!9320 lt!316036)) lt!316032))))

(assert (=> b!202782 (validate_offset_bits!1 ((_ sign_extend 32) (size!4529 (buf!5034 (_2!9320 lt!316036)))) ((_ sign_extend 32) (currentByte!9474 (_2!9320 lt!315648))) ((_ sign_extend 32) (currentBit!9469 (_2!9320 lt!315648))) lt!316032)))

(declare-fun lt!316114 () Unit!14384)

(assert (=> b!202782 (= lt!316114 lt!316041)))

(declare-fun lt!316052 () tuple2!17346)

(assert (=> b!202782 (= lt!316052 (readNBitsLSBFirstsLoopPure!0 (_1!9326 lt!316062) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!169877 () Bool)

(assert (=> b!202782 (= res!169877 (= (_2!9325 lt!316052) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!139010 () Bool)

(assert (=> b!202782 (=> (not res!169877) (not e!139010))))

(assert (=> b!202782 e!139010))

(declare-fun lt!316089 () Unit!14384)

(declare-fun Unit!14399 () Unit!14384)

(assert (=> b!202782 (= lt!316089 Unit!14399)))

(declare-fun b!202786 () Bool)

(assert (=> b!202786 (= e!139007 (= (_2!9319 lt!316123) (_2!9319 lt!316091)))))

(declare-fun b!202788 () Bool)

(declare-fun res!169875 () Bool)

(assert (=> b!202788 (= res!169875 (= (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!316116))) (currentByte!9474 (_2!9320 lt!316116)) (currentBit!9469 (_2!9320 lt!316116))) (bvadd (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315648))) (currentByte!9474 (_2!9320 lt!315648)) (currentBit!9469 (_2!9320 lt!315648))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!202788 (=> (not res!169875) (not e!139008))))

(declare-fun b!202790 () Bool)

(declare-fun e!139011 () Bool)

(assert (=> b!202790 (= e!139011 e!139016)))

(declare-fun res!169876 () Bool)

(assert (=> b!202790 (=> (not res!169876) (not e!139016))))

(assert (=> b!202790 (= res!169876 (= (_2!9325 lt!316049) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!202790 (= lt!316049 (readNBitsLSBFirstsLoopPure!0 (_1!9326 lt!316067) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!316138 () Unit!14384)

(declare-fun lt!316078 () Unit!14384)

(assert (=> b!202790 (= lt!316138 lt!316078)))

(declare-fun lt!316093 () tuple2!17336)

(declare-fun lt!316121 () (_ BitVec 64))

(assert (=> b!202790 (validate_offset_bits!1 ((_ sign_extend 32) (size!4529 (buf!5034 (_2!9320 lt!316093)))) ((_ sign_extend 32) (currentByte!9474 (_2!9320 lt!315648))) ((_ sign_extend 32) (currentBit!9469 (_2!9320 lt!315648))) lt!316121)))

(assert (=> b!202790 (= lt!316078 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9320 lt!315648) (buf!5034 (_2!9320 lt!316093)) lt!316121))))

(declare-fun e!139006 () Bool)

(assert (=> b!202790 e!139006))

(declare-fun res!169856 () Bool)

(assert (=> b!202790 (=> (not res!169856) (not e!139006))))

(assert (=> b!202790 (= res!169856 (and (= (size!4529 (buf!5034 (_2!9320 lt!315648))) (size!4529 (buf!5034 (_2!9320 lt!316093)))) (bvsge lt!316121 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202790 (= lt!316121 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!202790 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!202790 (= lt!316067 (reader!0 (_2!9320 lt!315648) (_2!9320 lt!316093)))))

(declare-fun b!202792 () Bool)

(declare-fun res!169865 () Bool)

(assert (=> b!202792 (=> (not res!169865) (not e!139011))))

(assert (=> b!202792 (= res!169865 (isPrefixOf!0 (_2!9320 lt!315648) (_2!9320 lt!316093)))))

(declare-fun b!202794 () Bool)

(assert (=> b!202794 (= e!139013 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!202796 () Bool)

(assert (=> b!202796 (= e!139010 (= (_1!9325 lt!316052) (_2!9326 lt!316062)))))

(declare-fun b!202798 () Bool)

(declare-fun lt!316136 () tuple2!17334)

(assert (=> b!202798 (= lt!316136 (readBitPure!0 (readerFrom!0 (_2!9320 lt!316116) (currentBit!9469 (_2!9320 lt!315648)) (currentByte!9474 (_2!9320 lt!315648)))))))

(declare-fun res!169879 () Bool)

(assert (=> b!202798 (= res!169879 (and (= (_2!9319 lt!316136) lt!316115) (= (_1!9319 lt!316136) (_2!9320 lt!316116))))))

(declare-fun e!139009 () Bool)

(assert (=> b!202798 (=> (not res!169879) (not e!139009))))

(assert (=> b!202798 (= e!139008 e!139009)))

(declare-fun b!202800 () Bool)

(assert (=> b!202800 (= e!139009 (= (bitIndex!0 (size!4529 (buf!5034 (_1!9319 lt!316136))) (currentByte!9474 (_1!9319 lt!316136)) (currentBit!9469 (_1!9319 lt!316136))) (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!316116))) (currentByte!9474 (_2!9320 lt!316116)) (currentBit!9469 (_2!9320 lt!316116)))))))

(declare-fun b!202784 () Bool)

(declare-fun res!169878 () Bool)

(assert (=> b!202784 (=> (not res!169878) (not e!139011))))

(assert (=> b!202784 (= res!169878 (= (size!4529 (buf!5034 (_2!9320 lt!315648))) (size!4529 (buf!5034 (_2!9320 lt!316093)))))))

(declare-fun d!69333 () Bool)

(assert (=> d!69333 e!139011))

(declare-fun res!169864 () Bool)

(assert (=> d!69333 (=> (not res!169864) (not e!139011))))

(assert (=> d!69333 (= res!169864 (invariant!0 (currentBit!9469 (_2!9320 lt!316093)) (currentByte!9474 (_2!9320 lt!316093)) (size!4529 (buf!5034 (_2!9320 lt!316093)))))))

(assert (=> d!69333 (= lt!316093 e!139020)))

(assert (=> d!69333 (= c!10052 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69333 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69333 (= (appendBitsLSBFirstLoopTR!0 (_2!9320 lt!315648) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!316093)))

(declare-fun b!202801 () Bool)

(assert (=> b!202801 (= e!139006 (validate_offset_bits!1 ((_ sign_extend 32) (size!4529 (buf!5034 (_2!9320 lt!315648)))) ((_ sign_extend 32) (currentByte!9474 (_2!9320 lt!315648))) ((_ sign_extend 32) (currentBit!9469 (_2!9320 lt!315648))) lt!316121))))

(declare-fun b!202803 () Bool)

(declare-fun res!169869 () Bool)

(assert (=> b!202803 (=> (not res!169869) (not e!139011))))

(declare-fun lt!316102 () (_ BitVec 64))

(declare-fun lt!316132 () (_ BitVec 64))

(assert (=> b!202803 (= res!169869 (= (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!316093))) (currentByte!9474 (_2!9320 lt!316093)) (currentBit!9469 (_2!9320 lt!316093))) (bvsub lt!316102 lt!316132)))))

(assert (=> b!202803 (or (= (bvand lt!316102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316132 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!316102 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!316102 lt!316132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202803 (= lt!316132 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!316090 () (_ BitVec 64))

(declare-fun lt!316111 () (_ BitVec 64))

(assert (=> b!202803 (= lt!316102 (bvadd lt!316090 lt!316111))))

(assert (=> b!202803 (or (not (= (bvand lt!316090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!316111 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!316090 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!316090 lt!316111) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!202803 (= lt!316111 ((_ sign_extend 32) nBits!348))))

(assert (=> b!202803 (= lt!316090 (bitIndex!0 (size!4529 (buf!5034 (_2!9320 lt!315648))) (currentByte!9474 (_2!9320 lt!315648)) (currentBit!9469 (_2!9320 lt!315648))))))

(declare-fun b!202805 () Bool)

(assert (=> b!202805 (= e!139013 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!202807 () Bool)

(declare-fun res!169860 () Bool)

(assert (=> b!202807 (= res!169860 (isPrefixOf!0 (_2!9320 lt!315648) (_2!9320 lt!316116)))))

(assert (=> b!202807 (=> (not res!169860) (not e!139008))))

(assert (= (and d!69333 c!10052) b!202780))

(assert (= (and d!69333 (not c!10052)) b!202782))

(assert (= (and b!202782 res!169871) b!202788))

(assert (= (and b!202788 res!169875) b!202807))

(assert (= (and b!202807 res!169860) b!202798))

(assert (= (and b!202798 res!169879) b!202800))

(assert (= (and b!202782 res!169868) b!202786))

(assert (= (and b!202782 c!10054) b!202805))

(assert (= (and b!202782 (not c!10054)) b!202794))

(assert (= (and b!202782 res!169877) b!202796))

(assert (= (or b!202780 b!202782) bm!3191))

(assert (= (and d!69333 res!169864) b!202784))

(assert (= (and b!202784 res!169878) b!202803))

(assert (= (and b!202803 res!169869) b!202792))

(assert (= (and b!202792 res!169865) b!202790))

(assert (= (and b!202790 res!169856) b!202801))

(assert (= (and b!202790 res!169876) b!202777))

(declare-fun m!313273 () Bool)

(assert (=> b!202800 m!313273))

(declare-fun m!313275 () Bool)

(assert (=> b!202800 m!313275))

(declare-fun m!313279 () Bool)

(assert (=> b!202790 m!313279))

(declare-fun m!313283 () Bool)

(assert (=> b!202790 m!313283))

(declare-fun m!313289 () Bool)

(assert (=> b!202790 m!313289))

(declare-fun m!313291 () Bool)

(assert (=> b!202790 m!313291))

(declare-fun m!313293 () Bool)

(assert (=> b!202790 m!313293))

(declare-fun m!313297 () Bool)

(assert (=> b!202790 m!313297))

(declare-fun m!313301 () Bool)

(assert (=> b!202792 m!313301))

(declare-fun m!313305 () Bool)

(assert (=> b!202801 m!313305))

(declare-fun m!313307 () Bool)

(assert (=> b!202798 m!313307))

(assert (=> b!202798 m!313307))

(declare-fun m!313309 () Bool)

(assert (=> b!202798 m!313309))

(declare-fun m!313315 () Bool)

(assert (=> bm!3191 m!313315))

(assert (=> b!202788 m!313275))

(assert (=> b!202788 m!313133))

(declare-fun m!313319 () Bool)

(assert (=> d!69333 m!313319))

(declare-fun m!313323 () Bool)

(assert (=> b!202780 m!313323))

(declare-fun m!313325 () Bool)

(assert (=> b!202807 m!313325))

(declare-fun m!313329 () Bool)

(assert (=> b!202803 m!313329))

(assert (=> b!202803 m!313133))

(declare-fun m!313335 () Bool)

(assert (=> b!202782 m!313335))

(declare-fun m!313337 () Bool)

(assert (=> b!202782 m!313337))

(declare-fun m!313343 () Bool)

(assert (=> b!202782 m!313343))

(declare-fun m!313345 () Bool)

(assert (=> b!202782 m!313345))

(declare-fun m!313347 () Bool)

(assert (=> b!202782 m!313347))

(declare-fun m!313351 () Bool)

(assert (=> b!202782 m!313351))

(assert (=> b!202782 m!313133))

(declare-fun m!313355 () Bool)

(assert (=> b!202782 m!313355))

(declare-fun m!313359 () Bool)

(assert (=> b!202782 m!313359))

(assert (=> b!202782 m!313293))

(declare-fun m!313367 () Bool)

(assert (=> b!202782 m!313367))

(declare-fun m!313369 () Bool)

(assert (=> b!202782 m!313369))

(declare-fun m!313377 () Bool)

(assert (=> b!202782 m!313377))

(declare-fun m!313379 () Bool)

(assert (=> b!202782 m!313379))

(declare-fun m!313383 () Bool)

(assert (=> b!202782 m!313383))

(declare-fun m!313387 () Bool)

(assert (=> b!202782 m!313387))

(declare-fun m!313391 () Bool)

(assert (=> b!202782 m!313391))

(declare-fun m!313393 () Bool)

(assert (=> b!202782 m!313393))

(declare-fun m!313397 () Bool)

(assert (=> b!202782 m!313397))

(declare-fun m!313401 () Bool)

(assert (=> b!202782 m!313401))

(assert (=> b!202782 m!313291))

(declare-fun m!313409 () Bool)

(assert (=> b!202782 m!313409))

(declare-fun m!313413 () Bool)

(assert (=> b!202782 m!313413))

(declare-fun m!313417 () Bool)

(assert (=> b!202782 m!313417))

(declare-fun m!313423 () Bool)

(assert (=> b!202782 m!313423))

(declare-fun m!313427 () Bool)

(assert (=> b!202782 m!313427))

(assert (=> b!202782 m!313427))

(declare-fun m!313433 () Bool)

(assert (=> b!202782 m!313433))

(declare-fun m!313437 () Bool)

(assert (=> b!202782 m!313437))

(declare-fun m!313441 () Bool)

(assert (=> b!202782 m!313441))

(declare-fun m!313447 () Bool)

(assert (=> b!202782 m!313447))

(declare-fun m!313449 () Bool)

(assert (=> b!202782 m!313449))

(declare-fun m!313451 () Bool)

(assert (=> b!202782 m!313451))

(declare-fun m!313455 () Bool)

(assert (=> b!202782 m!313455))

(assert (=> b!202584 d!69333))

(check-sat (not b!202666) (not d!69333) (not d!69291) (not b!202631) (not b!202788) (not b!202798) (not b!202782) (not b!202792) (not b!202649) (not bm!3191) (not b!202800) (not d!69321) (not b!202668) (not d!69295) (not b!202803) (not d!69293) (not b!202651) (not b!202676) (not d!69329) (not d!69297) (not d!69303) (not d!69299) (not b!202790) (not b!202801) (not b!202674) (not b!202807) (not b!202780) (not b!202648) (not b!202650) (not d!69325))

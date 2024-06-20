; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20780 () Bool)

(assert start!20780)

(declare-fun b!105179 () Bool)

(declare-fun e!68896 () Bool)

(declare-datatypes ((array!4877 0))(
  ( (array!4878 (arr!2818 (Array (_ BitVec 32) (_ BitVec 8))) (size!2225 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3924 0))(
  ( (BitStream!3925 (buf!2596 array!4877) (currentByte!5089 (_ BitVec 32)) (currentBit!5084 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8658 0))(
  ( (tuple2!8659 (_1!4586 BitStream!3924) (_2!4586 Bool)) )
))
(declare-fun lt!154790 () tuple2!8658)

(declare-fun lt!154778 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105179 (= e!68896 (= (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!154790))) (currentByte!5089 (_1!4586 lt!154790)) (currentBit!5084 (_1!4586 lt!154790))) lt!154778))))

(declare-fun b!105180 () Bool)

(declare-fun e!68901 () Bool)

(declare-fun e!68900 () Bool)

(assert (=> b!105180 (= e!68901 (not e!68900))))

(declare-fun res!86619 () Bool)

(assert (=> b!105180 (=> res!86619 e!68900)))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((tuple2!8660 0))(
  ( (tuple2!8661 (_1!4587 BitStream!3924) (_2!4587 BitStream!3924)) )
))
(declare-fun lt!154789 () tuple2!8660)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!154794 () (_ BitVec 64))

(declare-datatypes ((tuple2!8662 0))(
  ( (tuple2!8663 (_1!4588 BitStream!3924) (_2!4588 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8662)

(assert (=> b!105180 (= res!86619 (not (= (_1!4588 (readNLeastSignificantBitsLoopPure!0 (_1!4587 lt!154789) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154794)) (_2!4587 lt!154789))))))

(declare-datatypes ((Unit!6448 0))(
  ( (Unit!6449) )
))
(declare-datatypes ((tuple2!8664 0))(
  ( (tuple2!8665 (_1!4589 Unit!6448) (_2!4589 BitStream!3924)) )
))
(declare-fun lt!154775 () tuple2!8664)

(declare-fun lt!154777 () tuple2!8664)

(declare-fun lt!154774 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105180 (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))) ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154777))) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154777))) lt!154774)))

(declare-fun lt!154773 () Unit!6448)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3924 array!4877 (_ BitVec 64)) Unit!6448)

(assert (=> b!105180 (= lt!154773 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4589 lt!154777) (buf!2596 (_2!4589 lt!154775)) lt!154774))))

(assert (=> b!105180 (= lt!154774 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!154779 () tuple2!8658)

(declare-fun lt!154776 () (_ BitVec 64))

(declare-fun lt!154791 () (_ BitVec 64))

(assert (=> b!105180 (= lt!154794 (bvor lt!154776 (ite (_2!4586 lt!154779) lt!154791 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!154783 () tuple2!8660)

(declare-fun lt!154786 () tuple2!8662)

(assert (=> b!105180 (= lt!154786 (readNLeastSignificantBitsLoopPure!0 (_1!4587 lt!154783) nBits!396 i!615 lt!154776))))

(declare-fun thiss!1305 () BitStream!3924)

(declare-fun lt!154788 () (_ BitVec 64))

(assert (=> b!105180 (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))) ((_ sign_extend 32) (currentByte!5089 thiss!1305)) ((_ sign_extend 32) (currentBit!5084 thiss!1305)) lt!154788)))

(declare-fun lt!154781 () Unit!6448)

(assert (=> b!105180 (= lt!154781 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2596 (_2!4589 lt!154775)) lt!154788))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!105180 (= lt!154776 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!154782 () Bool)

(assert (=> b!105180 (= (_2!4586 lt!154779) lt!154782)))

(declare-fun readBitPure!0 (BitStream!3924) tuple2!8658)

(assert (=> b!105180 (= lt!154779 (readBitPure!0 (_1!4587 lt!154783)))))

(declare-fun reader!0 (BitStream!3924 BitStream!3924) tuple2!8660)

(assert (=> b!105180 (= lt!154789 (reader!0 (_2!4589 lt!154777) (_2!4589 lt!154775)))))

(assert (=> b!105180 (= lt!154783 (reader!0 thiss!1305 (_2!4589 lt!154775)))))

(declare-fun e!68902 () Bool)

(assert (=> b!105180 e!68902))

(declare-fun res!86613 () Bool)

(assert (=> b!105180 (=> (not res!86613) (not e!68902))))

(declare-fun lt!154784 () tuple2!8658)

(declare-fun lt!154772 () tuple2!8658)

(assert (=> b!105180 (= res!86613 (= (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!154784))) (currentByte!5089 (_1!4586 lt!154784)) (currentBit!5084 (_1!4586 lt!154784))) (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!154772))) (currentByte!5089 (_1!4586 lt!154772)) (currentBit!5084 (_1!4586 lt!154772)))))))

(declare-fun lt!154787 () Unit!6448)

(declare-fun lt!154771 () BitStream!3924)

(declare-fun readBitPrefixLemma!0 (BitStream!3924 BitStream!3924) Unit!6448)

(assert (=> b!105180 (= lt!154787 (readBitPrefixLemma!0 lt!154771 (_2!4589 lt!154775)))))

(assert (=> b!105180 (= lt!154772 (readBitPure!0 (BitStream!3925 (buf!2596 (_2!4589 lt!154775)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305))))))

(assert (=> b!105180 (= lt!154784 (readBitPure!0 lt!154771))))

(assert (=> b!105180 (= lt!154771 (BitStream!3925 (buf!2596 (_2!4589 lt!154777)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)))))

(declare-fun e!68903 () Bool)

(assert (=> b!105180 e!68903))

(declare-fun res!86614 () Bool)

(assert (=> b!105180 (=> (not res!86614) (not e!68903))))

(declare-fun isPrefixOf!0 (BitStream!3924 BitStream!3924) Bool)

(assert (=> b!105180 (= res!86614 (isPrefixOf!0 thiss!1305 (_2!4589 lt!154775)))))

(declare-fun lt!154780 () Unit!6448)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3924 BitStream!3924 BitStream!3924) Unit!6448)

(assert (=> b!105180 (= lt!154780 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4589 lt!154777) (_2!4589 lt!154775)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3924 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8664)

(assert (=> b!105180 (= lt!154775 (appendNLeastSignificantBitsLoop!0 (_2!4589 lt!154777) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!68904 () Bool)

(assert (=> b!105180 e!68904))

(declare-fun res!86615 () Bool)

(assert (=> b!105180 (=> (not res!86615) (not e!68904))))

(assert (=> b!105180 (= res!86615 (= (size!2225 (buf!2596 thiss!1305)) (size!2225 (buf!2596 (_2!4589 lt!154777)))))))

(declare-fun appendBit!0 (BitStream!3924 Bool) tuple2!8664)

(assert (=> b!105180 (= lt!154777 (appendBit!0 thiss!1305 lt!154782))))

(assert (=> b!105180 (= lt!154782 (not (= (bvand v!199 lt!154791) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105180 (= lt!154791 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!105181 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!3924 (_ BitVec 64)) Bool)

(assert (=> b!105181 (= e!68900 (moveBitIndexPrecond!0 (_2!4587 lt!154783) (bvsub (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154775))) (currentByte!5089 (_2!4589 lt!154775)) (currentBit!5084 (_2!4589 lt!154775))))))))

(declare-fun lt!154793 () tuple2!8662)

(assert (=> b!105181 (and (= (_2!4588 lt!154786) (_2!4588 lt!154793)) (= (_1!4588 lt!154786) (_1!4588 lt!154793)))))

(declare-fun lt!154785 () Unit!6448)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6448)

(assert (=> b!105181 (= lt!154785 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4587 lt!154783) nBits!396 i!615 lt!154776))))

(declare-fun withMovedBitIndex!0 (BitStream!3924 (_ BitVec 64)) BitStream!3924)

(assert (=> b!105181 (= lt!154793 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4587 lt!154783) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154794))))

(declare-fun b!105182 () Bool)

(declare-fun e!68899 () Bool)

(assert (=> b!105182 (= e!68899 e!68901)))

(declare-fun res!86611 () Bool)

(assert (=> b!105182 (=> (not res!86611) (not e!68901))))

(assert (=> b!105182 (= res!86611 (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 thiss!1305))) ((_ sign_extend 32) (currentByte!5089 thiss!1305)) ((_ sign_extend 32) (currentBit!5084 thiss!1305)) lt!154788))))

(assert (=> b!105182 (= lt!154788 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!105183 () Bool)

(assert (=> b!105183 (= e!68902 (= (_2!4586 lt!154784) (_2!4586 lt!154772)))))

(declare-fun b!105184 () Bool)

(declare-fun e!68897 () Bool)

(assert (=> b!105184 (= e!68904 e!68897)))

(declare-fun res!86616 () Bool)

(assert (=> b!105184 (=> (not res!86616) (not e!68897))))

(declare-fun lt!154792 () (_ BitVec 64))

(assert (=> b!105184 (= res!86616 (= lt!154778 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!154792)))))

(assert (=> b!105184 (= lt!154778 (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154777))) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777))))))

(assert (=> b!105184 (= lt!154792 (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)))))

(declare-fun b!105185 () Bool)

(assert (=> b!105185 (= e!68897 e!68896)))

(declare-fun res!86612 () Bool)

(assert (=> b!105185 (=> (not res!86612) (not e!68896))))

(assert (=> b!105185 (= res!86612 (and (= (_2!4586 lt!154790) lt!154782) (= (_1!4586 lt!154790) (_2!4589 lt!154777))))))

(declare-fun readerFrom!0 (BitStream!3924 (_ BitVec 32) (_ BitVec 32)) BitStream!3924)

(assert (=> b!105185 (= lt!154790 (readBitPure!0 (readerFrom!0 (_2!4589 lt!154777) (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305))))))

(declare-fun res!86610 () Bool)

(assert (=> start!20780 (=> (not res!86610) (not e!68899))))

(assert (=> start!20780 (= res!86610 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20780 e!68899))

(assert (=> start!20780 true))

(declare-fun e!68898 () Bool)

(declare-fun inv!12 (BitStream!3924) Bool)

(assert (=> start!20780 (and (inv!12 thiss!1305) e!68898)))

(declare-fun b!105186 () Bool)

(declare-fun res!86618 () Bool)

(assert (=> b!105186 (=> (not res!86618) (not e!68901))))

(assert (=> b!105186 (= res!86618 (bvslt i!615 nBits!396))))

(declare-fun b!105187 () Bool)

(declare-fun res!86609 () Bool)

(assert (=> b!105187 (=> (not res!86609) (not e!68903))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!105187 (= res!86609 (invariant!0 (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305) (size!2225 (buf!2596 (_2!4589 lt!154777)))))))

(declare-fun b!105188 () Bool)

(declare-fun res!86617 () Bool)

(assert (=> b!105188 (=> (not res!86617) (not e!68897))))

(assert (=> b!105188 (= res!86617 (isPrefixOf!0 thiss!1305 (_2!4589 lt!154777)))))

(declare-fun b!105189 () Bool)

(assert (=> b!105189 (= e!68903 (invariant!0 (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305) (size!2225 (buf!2596 (_2!4589 lt!154775)))))))

(declare-fun b!105190 () Bool)

(declare-fun res!86608 () Bool)

(assert (=> b!105190 (=> (not res!86608) (not e!68901))))

(assert (=> b!105190 (= res!86608 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!105191 () Bool)

(declare-fun array_inv!2027 (array!4877) Bool)

(assert (=> b!105191 (= e!68898 (array_inv!2027 (buf!2596 thiss!1305)))))

(assert (= (and start!20780 res!86610) b!105182))

(assert (= (and b!105182 res!86611) b!105190))

(assert (= (and b!105190 res!86608) b!105186))

(assert (= (and b!105186 res!86618) b!105180))

(assert (= (and b!105180 res!86615) b!105184))

(assert (= (and b!105184 res!86616) b!105188))

(assert (= (and b!105188 res!86617) b!105185))

(assert (= (and b!105185 res!86612) b!105179))

(assert (= (and b!105180 res!86614) b!105187))

(assert (= (and b!105187 res!86609) b!105189))

(assert (= (and b!105180 res!86613) b!105183))

(assert (= (and b!105180 (not res!86619)) b!105181))

(assert (= start!20780 b!105191))

(declare-fun m!154399 () Bool)

(assert (=> b!105181 m!154399))

(declare-fun m!154401 () Bool)

(assert (=> b!105181 m!154401))

(declare-fun m!154403 () Bool)

(assert (=> b!105181 m!154403))

(declare-fun m!154405 () Bool)

(assert (=> b!105181 m!154405))

(assert (=> b!105181 m!154403))

(declare-fun m!154407 () Bool)

(assert (=> b!105181 m!154407))

(declare-fun m!154409 () Bool)

(assert (=> b!105181 m!154409))

(declare-fun m!154411 () Bool)

(assert (=> b!105180 m!154411))

(declare-fun m!154413 () Bool)

(assert (=> b!105180 m!154413))

(declare-fun m!154415 () Bool)

(assert (=> b!105180 m!154415))

(declare-fun m!154417 () Bool)

(assert (=> b!105180 m!154417))

(declare-fun m!154419 () Bool)

(assert (=> b!105180 m!154419))

(declare-fun m!154421 () Bool)

(assert (=> b!105180 m!154421))

(declare-fun m!154423 () Bool)

(assert (=> b!105180 m!154423))

(declare-fun m!154425 () Bool)

(assert (=> b!105180 m!154425))

(declare-fun m!154427 () Bool)

(assert (=> b!105180 m!154427))

(declare-fun m!154429 () Bool)

(assert (=> b!105180 m!154429))

(declare-fun m!154431 () Bool)

(assert (=> b!105180 m!154431))

(declare-fun m!154433 () Bool)

(assert (=> b!105180 m!154433))

(declare-fun m!154435 () Bool)

(assert (=> b!105180 m!154435))

(declare-fun m!154437 () Bool)

(assert (=> b!105180 m!154437))

(declare-fun m!154439 () Bool)

(assert (=> b!105180 m!154439))

(declare-fun m!154441 () Bool)

(assert (=> b!105180 m!154441))

(declare-fun m!154443 () Bool)

(assert (=> b!105180 m!154443))

(declare-fun m!154445 () Bool)

(assert (=> b!105180 m!154445))

(declare-fun m!154447 () Bool)

(assert (=> b!105180 m!154447))

(declare-fun m!154449 () Bool)

(assert (=> b!105189 m!154449))

(declare-fun m!154451 () Bool)

(assert (=> b!105191 m!154451))

(declare-fun m!154453 () Bool)

(assert (=> b!105190 m!154453))

(declare-fun m!154455 () Bool)

(assert (=> b!105188 m!154455))

(declare-fun m!154457 () Bool)

(assert (=> b!105182 m!154457))

(declare-fun m!154459 () Bool)

(assert (=> b!105187 m!154459))

(declare-fun m!154461 () Bool)

(assert (=> start!20780 m!154461))

(declare-fun m!154463 () Bool)

(assert (=> b!105185 m!154463))

(assert (=> b!105185 m!154463))

(declare-fun m!154465 () Bool)

(assert (=> b!105185 m!154465))

(declare-fun m!154467 () Bool)

(assert (=> b!105184 m!154467))

(assert (=> b!105184 m!154401))

(declare-fun m!154469 () Bool)

(assert (=> b!105179 m!154469))

(check-sat (not start!20780) (not b!105181) (not b!105189) (not b!105190) (not b!105188) (not b!105182) (not b!105191) (not b!105180) (not b!105185) (not b!105184) (not b!105179) (not b!105187))
(check-sat)
(get-model)

(declare-fun d!33056 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33056 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 thiss!1305))) ((_ sign_extend 32) (currentByte!5089 thiss!1305)) ((_ sign_extend 32) (currentBit!5084 thiss!1305)) lt!154788) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2225 (buf!2596 thiss!1305))) ((_ sign_extend 32) (currentByte!5089 thiss!1305)) ((_ sign_extend 32) (currentBit!5084 thiss!1305))) lt!154788))))

(declare-fun bs!8077 () Bool)

(assert (= bs!8077 d!33056))

(declare-fun m!154999 () Bool)

(assert (=> bs!8077 m!154999))

(assert (=> b!105182 d!33056))

(declare-fun d!33058 () Bool)

(declare-datatypes ((tuple2!8682 0))(
  ( (tuple2!8683 (_1!4598 (_ BitVec 64)) (_2!4598 BitStream!3924)) )
))
(declare-fun lt!155533 () tuple2!8682)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8682)

(assert (=> d!33058 (= lt!155533 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4587 lt!154783) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154794))))

(assert (=> d!33058 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4587 lt!154783) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154794) (tuple2!8663 (_2!4598 lt!155533) (_1!4598 lt!155533)))))

(declare-fun bs!8078 () Bool)

(assert (= bs!8078 d!33058))

(assert (=> bs!8078 m!154403))

(declare-fun m!155005 () Bool)

(assert (=> bs!8078 m!155005))

(assert (=> b!105181 d!33058))

(declare-fun d!33062 () Bool)

(declare-fun lt!155551 () tuple2!8662)

(declare-fun lt!155547 () tuple2!8662)

(assert (=> d!33062 (and (= (_2!4588 lt!155551) (_2!4588 lt!155547)) (= (_1!4588 lt!155551) (_1!4588 lt!155547)))))

(declare-fun lt!155546 () (_ BitVec 64))

(declare-fun lt!155549 () Unit!6448)

(declare-fun lt!155550 () Bool)

(declare-fun lt!155548 () BitStream!3924)

(declare-fun choose!45 (BitStream!3924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8662 tuple2!8662 BitStream!3924 (_ BitVec 64) Bool BitStream!3924 (_ BitVec 64) tuple2!8662 tuple2!8662 BitStream!3924 (_ BitVec 64)) Unit!6448)

(assert (=> d!33062 (= lt!155549 (choose!45 (_1!4587 lt!154783) nBits!396 i!615 lt!154776 lt!155551 (tuple2!8663 (_1!4588 lt!155551) (_2!4588 lt!155551)) (_1!4588 lt!155551) (_2!4588 lt!155551) lt!155550 lt!155548 lt!155546 lt!155547 (tuple2!8663 (_1!4588 lt!155547) (_2!4588 lt!155547)) (_1!4588 lt!155547) (_2!4588 lt!155547)))))

(assert (=> d!33062 (= lt!155547 (readNLeastSignificantBitsLoopPure!0 lt!155548 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!155546))))

(assert (=> d!33062 (= lt!155546 (bvor lt!154776 (ite lt!155550 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33062 (= lt!155548 (withMovedBitIndex!0 (_1!4587 lt!154783) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!33062 (= lt!155550 (_2!4586 (readBitPure!0 (_1!4587 lt!154783))))))

(assert (=> d!33062 (= lt!155551 (readNLeastSignificantBitsLoopPure!0 (_1!4587 lt!154783) nBits!396 i!615 lt!154776))))

(assert (=> d!33062 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4587 lt!154783) nBits!396 i!615 lt!154776) lt!155549)))

(declare-fun bs!8080 () Bool)

(assert (= bs!8080 d!33062))

(assert (=> bs!8080 m!154437))

(assert (=> bs!8080 m!154435))

(assert (=> bs!8080 m!154403))

(declare-fun m!155007 () Bool)

(assert (=> bs!8080 m!155007))

(declare-fun m!155009 () Bool)

(assert (=> bs!8080 m!155009))

(assert (=> b!105181 d!33062))

(declare-fun d!33064 () Bool)

(declare-fun e!69064 () Bool)

(assert (=> d!33064 e!69064))

(declare-fun res!86845 () Bool)

(assert (=> d!33064 (=> (not res!86845) (not e!69064))))

(declare-fun lt!155567 () (_ BitVec 64))

(declare-fun lt!155564 () (_ BitVec 64))

(declare-fun lt!155568 () (_ BitVec 64))

(assert (=> d!33064 (= res!86845 (= lt!155564 (bvsub lt!155567 lt!155568)))))

(assert (=> d!33064 (or (= (bvand lt!155567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155568 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155567 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155567 lt!155568) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33064 (= lt!155568 (remainingBits!0 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))) ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154775))) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154775)))))))

(declare-fun lt!155566 () (_ BitVec 64))

(declare-fun lt!155569 () (_ BitVec 64))

(assert (=> d!33064 (= lt!155567 (bvmul lt!155566 lt!155569))))

(assert (=> d!33064 (or (= lt!155566 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155569 (bvsdiv (bvmul lt!155566 lt!155569) lt!155566)))))

(assert (=> d!33064 (= lt!155569 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33064 (= lt!155566 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))))))

(assert (=> d!33064 (= lt!155564 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154775))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154775)))))))

(assert (=> d!33064 (invariant!0 (currentBit!5084 (_2!4589 lt!154775)) (currentByte!5089 (_2!4589 lt!154775)) (size!2225 (buf!2596 (_2!4589 lt!154775))))))

(assert (=> d!33064 (= (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154775))) (currentByte!5089 (_2!4589 lt!154775)) (currentBit!5084 (_2!4589 lt!154775))) lt!155564)))

(declare-fun b!105461 () Bool)

(declare-fun res!86844 () Bool)

(assert (=> b!105461 (=> (not res!86844) (not e!69064))))

(assert (=> b!105461 (= res!86844 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155564))))

(declare-fun b!105462 () Bool)

(declare-fun lt!155565 () (_ BitVec 64))

(assert (=> b!105462 (= e!69064 (bvsle lt!155564 (bvmul lt!155565 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105462 (or (= lt!155565 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155565 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155565)))))

(assert (=> b!105462 (= lt!155565 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))))))

(assert (= (and d!33064 res!86845) b!105461))

(assert (= (and b!105461 res!86844) b!105462))

(declare-fun m!155011 () Bool)

(assert (=> d!33064 m!155011))

(declare-fun m!155013 () Bool)

(assert (=> d!33064 m!155013))

(assert (=> b!105181 d!33064))

(declare-fun d!33066 () Bool)

(declare-fun e!69067 () Bool)

(assert (=> d!33066 e!69067))

(declare-fun res!86848 () Bool)

(assert (=> d!33066 (=> (not res!86848) (not e!69067))))

(declare-fun lt!155575 () (_ BitVec 64))

(declare-fun lt!155574 () BitStream!3924)

(assert (=> d!33066 (= res!86848 (= (bvadd lt!155575 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2225 (buf!2596 lt!155574)) (currentByte!5089 lt!155574) (currentBit!5084 lt!155574))))))

(assert (=> d!33066 (or (not (= (bvand lt!155575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!155575 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!155575 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33066 (= lt!155575 (bitIndex!0 (size!2225 (buf!2596 (_1!4587 lt!154783))) (currentByte!5089 (_1!4587 lt!154783)) (currentBit!5084 (_1!4587 lt!154783))))))

(declare-fun moveBitIndex!0 (BitStream!3924 (_ BitVec 64)) tuple2!8664)

(assert (=> d!33066 (= lt!155574 (_2!4589 (moveBitIndex!0 (_1!4587 lt!154783) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!33066 (moveBitIndexPrecond!0 (_1!4587 lt!154783) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!33066 (= (withMovedBitIndex!0 (_1!4587 lt!154783) #b0000000000000000000000000000000000000000000000000000000000000001) lt!155574)))

(declare-fun b!105465 () Bool)

(assert (=> b!105465 (= e!69067 (= (size!2225 (buf!2596 (_1!4587 lt!154783))) (size!2225 (buf!2596 lt!155574))))))

(assert (= (and d!33066 res!86848) b!105465))

(declare-fun m!155015 () Bool)

(assert (=> d!33066 m!155015))

(declare-fun m!155017 () Bool)

(assert (=> d!33066 m!155017))

(declare-fun m!155019 () Bool)

(assert (=> d!33066 m!155019))

(declare-fun m!155021 () Bool)

(assert (=> d!33066 m!155021))

(assert (=> b!105181 d!33066))

(declare-fun d!33068 () Bool)

(declare-fun res!86851 () Bool)

(declare-fun e!69070 () Bool)

(assert (=> d!33068 (=> (not res!86851) (not e!69070))))

(assert (=> d!33068 (= res!86851 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4587 lt!154783))))) (bvsub (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154775))) (currentByte!5089 (_2!4589 lt!154775)) (currentBit!5084 (_2!4589 lt!154775))))) (bvsle (bvsub (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154775))) (currentByte!5089 (_2!4589 lt!154775)) (currentBit!5084 (_2!4589 lt!154775)))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4587 lt!154783))))))))))

(assert (=> d!33068 (= (moveBitIndexPrecond!0 (_2!4587 lt!154783) (bvsub (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154775))) (currentByte!5089 (_2!4589 lt!154775)) (currentBit!5084 (_2!4589 lt!154775))))) e!69070)))

(declare-fun b!105469 () Bool)

(declare-fun lt!155578 () (_ BitVec 64))

(assert (=> b!105469 (= e!69070 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155578) (bvsle lt!155578 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4587 lt!154783))))))))))

(assert (=> b!105469 (= lt!155578 (bvadd (bitIndex!0 (size!2225 (buf!2596 (_2!4587 lt!154783))) (currentByte!5089 (_2!4587 lt!154783)) (currentBit!5084 (_2!4587 lt!154783))) (bvsub (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154775))) (currentByte!5089 (_2!4589 lt!154775)) (currentBit!5084 (_2!4589 lt!154775))))))))

(assert (= (and d!33068 res!86851) b!105469))

(declare-fun m!155023 () Bool)

(assert (=> b!105469 m!155023))

(assert (=> b!105181 d!33068))

(declare-fun d!33070 () Bool)

(declare-fun e!69071 () Bool)

(assert (=> d!33070 e!69071))

(declare-fun res!86853 () Bool)

(assert (=> d!33070 (=> (not res!86853) (not e!69071))))

(declare-fun lt!155582 () (_ BitVec 64))

(declare-fun lt!155579 () (_ BitVec 64))

(declare-fun lt!155583 () (_ BitVec 64))

(assert (=> d!33070 (= res!86853 (= lt!155579 (bvsub lt!155582 lt!155583)))))

(assert (=> d!33070 (or (= (bvand lt!155582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155583 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155582 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155582 lt!155583) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33070 (= lt!155583 (remainingBits!0 ((_ sign_extend 32) (size!2225 (buf!2596 thiss!1305))) ((_ sign_extend 32) (currentByte!5089 thiss!1305)) ((_ sign_extend 32) (currentBit!5084 thiss!1305))))))

(declare-fun lt!155581 () (_ BitVec 64))

(declare-fun lt!155584 () (_ BitVec 64))

(assert (=> d!33070 (= lt!155582 (bvmul lt!155581 lt!155584))))

(assert (=> d!33070 (or (= lt!155581 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155584 (bvsdiv (bvmul lt!155581 lt!155584) lt!155581)))))

(assert (=> d!33070 (= lt!155584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33070 (= lt!155581 ((_ sign_extend 32) (size!2225 (buf!2596 thiss!1305))))))

(assert (=> d!33070 (= lt!155579 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5089 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5084 thiss!1305))))))

(assert (=> d!33070 (invariant!0 (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305) (size!2225 (buf!2596 thiss!1305)))))

(assert (=> d!33070 (= (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)) lt!155579)))

(declare-fun b!105470 () Bool)

(declare-fun res!86852 () Bool)

(assert (=> b!105470 (=> (not res!86852) (not e!69071))))

(assert (=> b!105470 (= res!86852 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155579))))

(declare-fun b!105471 () Bool)

(declare-fun lt!155580 () (_ BitVec 64))

(assert (=> b!105471 (= e!69071 (bvsle lt!155579 (bvmul lt!155580 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105471 (or (= lt!155580 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155580 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155580)))))

(assert (=> b!105471 (= lt!155580 ((_ sign_extend 32) (size!2225 (buf!2596 thiss!1305))))))

(assert (= (and d!33070 res!86853) b!105470))

(assert (= (and b!105470 res!86852) b!105471))

(assert (=> d!33070 m!154999))

(declare-fun m!155025 () Bool)

(assert (=> d!33070 m!155025))

(assert (=> b!105181 d!33070))

(declare-fun d!33072 () Bool)

(assert (=> d!33072 (= (array_inv!2027 (buf!2596 thiss!1305)) (bvsge (size!2225 (buf!2596 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!105191 d!33072))

(declare-fun d!33074 () Bool)

(declare-fun e!69074 () Bool)

(assert (=> d!33074 e!69074))

(declare-fun res!86856 () Bool)

(assert (=> d!33074 (=> (not res!86856) (not e!69074))))

(declare-fun lt!155594 () tuple2!8658)

(declare-fun lt!155596 () tuple2!8658)

(assert (=> d!33074 (= res!86856 (= (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!155594))) (currentByte!5089 (_1!4586 lt!155594)) (currentBit!5084 (_1!4586 lt!155594))) (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!155596))) (currentByte!5089 (_1!4586 lt!155596)) (currentBit!5084 (_1!4586 lt!155596)))))))

(declare-fun lt!155595 () BitStream!3924)

(declare-fun lt!155593 () Unit!6448)

(declare-fun choose!50 (BitStream!3924 BitStream!3924 BitStream!3924 tuple2!8658 tuple2!8658 BitStream!3924 Bool tuple2!8658 tuple2!8658 BitStream!3924 Bool) Unit!6448)

(assert (=> d!33074 (= lt!155593 (choose!50 lt!154771 (_2!4589 lt!154775) lt!155595 lt!155594 (tuple2!8659 (_1!4586 lt!155594) (_2!4586 lt!155594)) (_1!4586 lt!155594) (_2!4586 lt!155594) lt!155596 (tuple2!8659 (_1!4586 lt!155596) (_2!4586 lt!155596)) (_1!4586 lt!155596) (_2!4586 lt!155596)))))

(assert (=> d!33074 (= lt!155596 (readBitPure!0 lt!155595))))

(assert (=> d!33074 (= lt!155594 (readBitPure!0 lt!154771))))

(assert (=> d!33074 (= lt!155595 (BitStream!3925 (buf!2596 (_2!4589 lt!154775)) (currentByte!5089 lt!154771) (currentBit!5084 lt!154771)))))

(assert (=> d!33074 (invariant!0 (currentBit!5084 lt!154771) (currentByte!5089 lt!154771) (size!2225 (buf!2596 (_2!4589 lt!154775))))))

(assert (=> d!33074 (= (readBitPrefixLemma!0 lt!154771 (_2!4589 lt!154775)) lt!155593)))

(declare-fun b!105474 () Bool)

(assert (=> b!105474 (= e!69074 (= (_2!4586 lt!155594) (_2!4586 lt!155596)))))

(assert (= (and d!33074 res!86856) b!105474))

(declare-fun m!155027 () Bool)

(assert (=> d!33074 m!155027))

(assert (=> d!33074 m!154427))

(declare-fun m!155029 () Bool)

(assert (=> d!33074 m!155029))

(declare-fun m!155031 () Bool)

(assert (=> d!33074 m!155031))

(declare-fun m!155033 () Bool)

(assert (=> d!33074 m!155033))

(declare-fun m!155035 () Bool)

(assert (=> d!33074 m!155035))

(assert (=> b!105180 d!33074))

(declare-fun d!33076 () Bool)

(assert (=> d!33076 (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))) ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154777))) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154777))) lt!154774)))

(declare-fun lt!155599 () Unit!6448)

(declare-fun choose!9 (BitStream!3924 array!4877 (_ BitVec 64) BitStream!3924) Unit!6448)

(assert (=> d!33076 (= lt!155599 (choose!9 (_2!4589 lt!154777) (buf!2596 (_2!4589 lt!154775)) lt!154774 (BitStream!3925 (buf!2596 (_2!4589 lt!154775)) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777)))))))

(assert (=> d!33076 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4589 lt!154777) (buf!2596 (_2!4589 lt!154775)) lt!154774) lt!155599)))

(declare-fun bs!8081 () Bool)

(assert (= bs!8081 d!33076))

(assert (=> bs!8081 m!154431))

(declare-fun m!155037 () Bool)

(assert (=> bs!8081 m!155037))

(assert (=> b!105180 d!33076))

(declare-fun d!33078 () Bool)

(declare-fun lt!155600 () tuple2!8682)

(assert (=> d!33078 (= lt!155600 (readNLeastSignificantBitsLoop!0 (_1!4587 lt!154783) nBits!396 i!615 lt!154776))))

(assert (=> d!33078 (= (readNLeastSignificantBitsLoopPure!0 (_1!4587 lt!154783) nBits!396 i!615 lt!154776) (tuple2!8663 (_2!4598 lt!155600) (_1!4598 lt!155600)))))

(declare-fun bs!8082 () Bool)

(assert (= bs!8082 d!33078))

(declare-fun m!155039 () Bool)

(assert (=> bs!8082 m!155039))

(assert (=> b!105180 d!33078))

(declare-fun d!33080 () Bool)

(declare-fun lt!155601 () tuple2!8682)

(assert (=> d!33080 (= lt!155601 (readNLeastSignificantBitsLoop!0 (_1!4587 lt!154789) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154794))))

(assert (=> d!33080 (= (readNLeastSignificantBitsLoopPure!0 (_1!4587 lt!154789) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!154794) (tuple2!8663 (_2!4598 lt!155601) (_1!4598 lt!155601)))))

(declare-fun bs!8083 () Bool)

(assert (= bs!8083 d!33080))

(declare-fun m!155041 () Bool)

(assert (=> bs!8083 m!155041))

(assert (=> b!105180 d!33080))

(declare-fun d!33082 () Bool)

(assert (=> d!33082 (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))) ((_ sign_extend 32) (currentByte!5089 thiss!1305)) ((_ sign_extend 32) (currentBit!5084 thiss!1305)) lt!154788)))

(declare-fun lt!155602 () Unit!6448)

(assert (=> d!33082 (= lt!155602 (choose!9 thiss!1305 (buf!2596 (_2!4589 lt!154775)) lt!154788 (BitStream!3925 (buf!2596 (_2!4589 lt!154775)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305))))))

(assert (=> d!33082 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2596 (_2!4589 lt!154775)) lt!154788) lt!155602)))

(declare-fun bs!8084 () Bool)

(assert (= bs!8084 d!33082))

(assert (=> bs!8084 m!154441))

(declare-fun m!155043 () Bool)

(assert (=> bs!8084 m!155043))

(assert (=> b!105180 d!33082))

(declare-fun d!33084 () Bool)

(assert (=> d!33084 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))) ((_ sign_extend 32) (currentByte!5089 thiss!1305)) ((_ sign_extend 32) (currentBit!5084 thiss!1305)) lt!154788) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))) ((_ sign_extend 32) (currentByte!5089 thiss!1305)) ((_ sign_extend 32) (currentBit!5084 thiss!1305))) lt!154788))))

(declare-fun bs!8085 () Bool)

(assert (= bs!8085 d!33084))

(declare-fun m!155045 () Bool)

(assert (=> bs!8085 m!155045))

(assert (=> b!105180 d!33084))

(declare-fun d!33086 () Bool)

(declare-fun e!69075 () Bool)

(assert (=> d!33086 e!69075))

(declare-fun res!86858 () Bool)

(assert (=> d!33086 (=> (not res!86858) (not e!69075))))

(declare-fun lt!155606 () (_ BitVec 64))

(declare-fun lt!155603 () (_ BitVec 64))

(declare-fun lt!155607 () (_ BitVec 64))

(assert (=> d!33086 (= res!86858 (= lt!155603 (bvsub lt!155606 lt!155607)))))

(assert (=> d!33086 (or (= (bvand lt!155606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155607 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155606 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155606 lt!155607) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33086 (= lt!155607 (remainingBits!0 ((_ sign_extend 32) (size!2225 (buf!2596 (_1!4586 lt!154772)))) ((_ sign_extend 32) (currentByte!5089 (_1!4586 lt!154772))) ((_ sign_extend 32) (currentBit!5084 (_1!4586 lt!154772)))))))

(declare-fun lt!155605 () (_ BitVec 64))

(declare-fun lt!155608 () (_ BitVec 64))

(assert (=> d!33086 (= lt!155606 (bvmul lt!155605 lt!155608))))

(assert (=> d!33086 (or (= lt!155605 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155608 (bvsdiv (bvmul lt!155605 lt!155608) lt!155605)))))

(assert (=> d!33086 (= lt!155608 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33086 (= lt!155605 ((_ sign_extend 32) (size!2225 (buf!2596 (_1!4586 lt!154772)))))))

(assert (=> d!33086 (= lt!155603 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5089 (_1!4586 lt!154772))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5084 (_1!4586 lt!154772)))))))

(assert (=> d!33086 (invariant!0 (currentBit!5084 (_1!4586 lt!154772)) (currentByte!5089 (_1!4586 lt!154772)) (size!2225 (buf!2596 (_1!4586 lt!154772))))))

(assert (=> d!33086 (= (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!154772))) (currentByte!5089 (_1!4586 lt!154772)) (currentBit!5084 (_1!4586 lt!154772))) lt!155603)))

(declare-fun b!105475 () Bool)

(declare-fun res!86857 () Bool)

(assert (=> b!105475 (=> (not res!86857) (not e!69075))))

(assert (=> b!105475 (= res!86857 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155603))))

(declare-fun b!105476 () Bool)

(declare-fun lt!155604 () (_ BitVec 64))

(assert (=> b!105476 (= e!69075 (bvsle lt!155603 (bvmul lt!155604 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105476 (or (= lt!155604 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155604 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155604)))))

(assert (=> b!105476 (= lt!155604 ((_ sign_extend 32) (size!2225 (buf!2596 (_1!4586 lt!154772)))))))

(assert (= (and d!33086 res!86858) b!105475))

(assert (= (and b!105475 res!86857) b!105476))

(declare-fun m!155047 () Bool)

(assert (=> d!33086 m!155047))

(declare-fun m!155049 () Bool)

(assert (=> d!33086 m!155049))

(assert (=> b!105180 d!33086))

(declare-fun d!33088 () Bool)

(assert (=> d!33088 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))) ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154777))) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154777))) lt!154774) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154775)))) ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154777))) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154777)))) lt!154774))))

(declare-fun bs!8086 () Bool)

(assert (= bs!8086 d!33088))

(declare-fun m!155051 () Bool)

(assert (=> bs!8086 m!155051))

(assert (=> b!105180 d!33088))

(declare-fun d!33090 () Bool)

(assert (=> d!33090 (isPrefixOf!0 thiss!1305 (_2!4589 lt!154775))))

(declare-fun lt!155611 () Unit!6448)

(declare-fun choose!30 (BitStream!3924 BitStream!3924 BitStream!3924) Unit!6448)

(assert (=> d!33090 (= lt!155611 (choose!30 thiss!1305 (_2!4589 lt!154777) (_2!4589 lt!154775)))))

(assert (=> d!33090 (isPrefixOf!0 thiss!1305 (_2!4589 lt!154777))))

(assert (=> d!33090 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4589 lt!154777) (_2!4589 lt!154775)) lt!155611)))

(declare-fun bs!8087 () Bool)

(assert (= bs!8087 d!33090))

(assert (=> bs!8087 m!154415))

(declare-fun m!155053 () Bool)

(assert (=> bs!8087 m!155053))

(assert (=> bs!8087 m!154455))

(assert (=> b!105180 d!33090))

(declare-fun d!33092 () Bool)

(declare-datatypes ((tuple2!8684 0))(
  ( (tuple2!8685 (_1!4599 Bool) (_2!4599 BitStream!3924)) )
))
(declare-fun lt!155614 () tuple2!8684)

(declare-fun readBit!0 (BitStream!3924) tuple2!8684)

(assert (=> d!33092 (= lt!155614 (readBit!0 lt!154771))))

(assert (=> d!33092 (= (readBitPure!0 lt!154771) (tuple2!8659 (_2!4599 lt!155614) (_1!4599 lt!155614)))))

(declare-fun bs!8088 () Bool)

(assert (= bs!8088 d!33092))

(declare-fun m!155055 () Bool)

(assert (=> bs!8088 m!155055))

(assert (=> b!105180 d!33092))

(declare-fun d!33094 () Bool)

(assert (=> d!33094 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!105180 d!33094))

(declare-fun d!33096 () Bool)

(declare-fun lt!155615 () tuple2!8684)

(assert (=> d!33096 (= lt!155615 (readBit!0 (_1!4587 lt!154783)))))

(assert (=> d!33096 (= (readBitPure!0 (_1!4587 lt!154783)) (tuple2!8659 (_2!4599 lt!155615) (_1!4599 lt!155615)))))

(declare-fun bs!8089 () Bool)

(assert (= bs!8089 d!33096))

(declare-fun m!155057 () Bool)

(assert (=> bs!8089 m!155057))

(assert (=> b!105180 d!33096))

(declare-fun b!105486 () Bool)

(declare-fun res!86869 () Bool)

(declare-fun e!69081 () Bool)

(assert (=> b!105486 (=> (not res!86869) (not e!69081))))

(declare-fun lt!155624 () (_ BitVec 64))

(declare-fun lt!155627 () tuple2!8664)

(declare-fun lt!155626 () (_ BitVec 64))

(assert (=> b!105486 (= res!86869 (= (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!155627))) (currentByte!5089 (_2!4589 lt!155627)) (currentBit!5084 (_2!4589 lt!155627))) (bvadd lt!155626 lt!155624)))))

(assert (=> b!105486 (or (not (= (bvand lt!155626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155624 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!155626 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!155626 lt!155624) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105486 (= lt!155624 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!105486 (= lt!155626 (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)))))

(declare-fun b!105487 () Bool)

(declare-fun res!86870 () Bool)

(assert (=> b!105487 (=> (not res!86870) (not e!69081))))

(assert (=> b!105487 (= res!86870 (isPrefixOf!0 thiss!1305 (_2!4589 lt!155627)))))

(declare-fun d!33098 () Bool)

(assert (=> d!33098 e!69081))

(declare-fun res!86867 () Bool)

(assert (=> d!33098 (=> (not res!86867) (not e!69081))))

(assert (=> d!33098 (= res!86867 (= (size!2225 (buf!2596 thiss!1305)) (size!2225 (buf!2596 (_2!4589 lt!155627)))))))

(declare-fun choose!16 (BitStream!3924 Bool) tuple2!8664)

(assert (=> d!33098 (= lt!155627 (choose!16 thiss!1305 lt!154782))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!33098 (validate_offset_bit!0 ((_ sign_extend 32) (size!2225 (buf!2596 thiss!1305))) ((_ sign_extend 32) (currentByte!5089 thiss!1305)) ((_ sign_extend 32) (currentBit!5084 thiss!1305)))))

(assert (=> d!33098 (= (appendBit!0 thiss!1305 lt!154782) lt!155627)))

(declare-fun b!105489 () Bool)

(declare-fun e!69080 () Bool)

(declare-fun lt!155625 () tuple2!8658)

(assert (=> b!105489 (= e!69080 (= (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!155625))) (currentByte!5089 (_1!4586 lt!155625)) (currentBit!5084 (_1!4586 lt!155625))) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!155627))) (currentByte!5089 (_2!4589 lt!155627)) (currentBit!5084 (_2!4589 lt!155627)))))))

(declare-fun b!105488 () Bool)

(assert (=> b!105488 (= e!69081 e!69080)))

(declare-fun res!86868 () Bool)

(assert (=> b!105488 (=> (not res!86868) (not e!69080))))

(assert (=> b!105488 (= res!86868 (and (= (_2!4586 lt!155625) lt!154782) (= (_1!4586 lt!155625) (_2!4589 lt!155627))))))

(assert (=> b!105488 (= lt!155625 (readBitPure!0 (readerFrom!0 (_2!4589 lt!155627) (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305))))))

(assert (= (and d!33098 res!86867) b!105486))

(assert (= (and b!105486 res!86869) b!105487))

(assert (= (and b!105487 res!86870) b!105488))

(assert (= (and b!105488 res!86868) b!105489))

(declare-fun m!155059 () Bool)

(assert (=> b!105486 m!155059))

(assert (=> b!105486 m!154401))

(declare-fun m!155061 () Bool)

(assert (=> b!105488 m!155061))

(assert (=> b!105488 m!155061))

(declare-fun m!155063 () Bool)

(assert (=> b!105488 m!155063))

(declare-fun m!155065 () Bool)

(assert (=> b!105487 m!155065))

(declare-fun m!155067 () Bool)

(assert (=> b!105489 m!155067))

(assert (=> b!105489 m!155059))

(declare-fun m!155069 () Bool)

(assert (=> d!33098 m!155069))

(declare-fun m!155071 () Bool)

(assert (=> d!33098 m!155071))

(assert (=> b!105180 d!33098))

(declare-fun b!105500 () Bool)

(declare-fun e!69087 () Unit!6448)

(declare-fun Unit!6468 () Unit!6448)

(assert (=> b!105500 (= e!69087 Unit!6468)))

(declare-fun lt!155683 () tuple2!8660)

(declare-fun b!105501 () Bool)

(declare-fun lt!155684 () (_ BitVec 64))

(declare-fun lt!155671 () (_ BitVec 64))

(declare-fun e!69086 () Bool)

(assert (=> b!105501 (= e!69086 (= (_1!4587 lt!155683) (withMovedBitIndex!0 (_2!4587 lt!155683) (bvsub lt!155684 lt!155671))))))

(assert (=> b!105501 (or (= (bvand lt!155684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155671 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155684 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155684 lt!155671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105501 (= lt!155671 (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154775))) (currentByte!5089 (_2!4589 lt!154775)) (currentBit!5084 (_2!4589 lt!154775))))))

(assert (=> b!105501 (= lt!155684 (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154777))) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777))))))

(declare-fun b!105502 () Bool)

(declare-fun res!86877 () Bool)

(assert (=> b!105502 (=> (not res!86877) (not e!69086))))

(assert (=> b!105502 (= res!86877 (isPrefixOf!0 (_2!4587 lt!155683) (_2!4589 lt!154775)))))

(declare-fun b!105503 () Bool)

(declare-fun lt!155676 () Unit!6448)

(assert (=> b!105503 (= e!69087 lt!155676)))

(declare-fun lt!155685 () (_ BitVec 64))

(assert (=> b!105503 (= lt!155685 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!155682 () (_ BitVec 64))

(assert (=> b!105503 (= lt!155682 (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154777))) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4877 array!4877 (_ BitVec 64) (_ BitVec 64)) Unit!6448)

(assert (=> b!105503 (= lt!155676 (arrayBitRangesEqSymmetric!0 (buf!2596 (_2!4589 lt!154777)) (buf!2596 (_2!4589 lt!154775)) lt!155685 lt!155682))))

(declare-fun arrayBitRangesEq!0 (array!4877 array!4877 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!105503 (arrayBitRangesEq!0 (buf!2596 (_2!4589 lt!154775)) (buf!2596 (_2!4589 lt!154777)) lt!155685 lt!155682)))

(declare-fun b!105504 () Bool)

(declare-fun res!86878 () Bool)

(assert (=> b!105504 (=> (not res!86878) (not e!69086))))

(assert (=> b!105504 (= res!86878 (isPrefixOf!0 (_1!4587 lt!155683) (_2!4589 lt!154777)))))

(declare-fun d!33100 () Bool)

(assert (=> d!33100 e!69086))

(declare-fun res!86879 () Bool)

(assert (=> d!33100 (=> (not res!86879) (not e!69086))))

(assert (=> d!33100 (= res!86879 (isPrefixOf!0 (_1!4587 lt!155683) (_2!4587 lt!155683)))))

(declare-fun lt!155678 () BitStream!3924)

(assert (=> d!33100 (= lt!155683 (tuple2!8661 lt!155678 (_2!4589 lt!154775)))))

(declare-fun lt!155668 () Unit!6448)

(declare-fun lt!155681 () Unit!6448)

(assert (=> d!33100 (= lt!155668 lt!155681)))

(assert (=> d!33100 (isPrefixOf!0 lt!155678 (_2!4589 lt!154775))))

(assert (=> d!33100 (= lt!155681 (lemmaIsPrefixTransitive!0 lt!155678 (_2!4589 lt!154775) (_2!4589 lt!154775)))))

(declare-fun lt!155670 () Unit!6448)

(declare-fun lt!155680 () Unit!6448)

(assert (=> d!33100 (= lt!155670 lt!155680)))

(assert (=> d!33100 (isPrefixOf!0 lt!155678 (_2!4589 lt!154775))))

(assert (=> d!33100 (= lt!155680 (lemmaIsPrefixTransitive!0 lt!155678 (_2!4589 lt!154777) (_2!4589 lt!154775)))))

(declare-fun lt!155674 () Unit!6448)

(assert (=> d!33100 (= lt!155674 e!69087)))

(declare-fun c!6507 () Bool)

(assert (=> d!33100 (= c!6507 (not (= (size!2225 (buf!2596 (_2!4589 lt!154777))) #b00000000000000000000000000000000)))))

(declare-fun lt!155672 () Unit!6448)

(declare-fun lt!155686 () Unit!6448)

(assert (=> d!33100 (= lt!155672 lt!155686)))

(assert (=> d!33100 (isPrefixOf!0 (_2!4589 lt!154775) (_2!4589 lt!154775))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3924) Unit!6448)

(assert (=> d!33100 (= lt!155686 (lemmaIsPrefixRefl!0 (_2!4589 lt!154775)))))

(declare-fun lt!155679 () Unit!6448)

(declare-fun lt!155687 () Unit!6448)

(assert (=> d!33100 (= lt!155679 lt!155687)))

(assert (=> d!33100 (= lt!155687 (lemmaIsPrefixRefl!0 (_2!4589 lt!154775)))))

(declare-fun lt!155675 () Unit!6448)

(declare-fun lt!155673 () Unit!6448)

(assert (=> d!33100 (= lt!155675 lt!155673)))

(assert (=> d!33100 (isPrefixOf!0 lt!155678 lt!155678)))

(assert (=> d!33100 (= lt!155673 (lemmaIsPrefixRefl!0 lt!155678))))

(declare-fun lt!155669 () Unit!6448)

(declare-fun lt!155677 () Unit!6448)

(assert (=> d!33100 (= lt!155669 lt!155677)))

(assert (=> d!33100 (isPrefixOf!0 (_2!4589 lt!154777) (_2!4589 lt!154777))))

(assert (=> d!33100 (= lt!155677 (lemmaIsPrefixRefl!0 (_2!4589 lt!154777)))))

(assert (=> d!33100 (= lt!155678 (BitStream!3925 (buf!2596 (_2!4589 lt!154775)) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777))))))

(assert (=> d!33100 (isPrefixOf!0 (_2!4589 lt!154777) (_2!4589 lt!154775))))

(assert (=> d!33100 (= (reader!0 (_2!4589 lt!154777) (_2!4589 lt!154775)) lt!155683)))

(assert (= (and d!33100 c!6507) b!105503))

(assert (= (and d!33100 (not c!6507)) b!105500))

(assert (= (and d!33100 res!86879) b!105504))

(assert (= (and b!105504 res!86878) b!105502))

(assert (= (and b!105502 res!86877) b!105501))

(declare-fun m!155073 () Bool)

(assert (=> b!105501 m!155073))

(assert (=> b!105501 m!154409))

(assert (=> b!105501 m!154467))

(declare-fun m!155075 () Bool)

(assert (=> b!105502 m!155075))

(declare-fun m!155077 () Bool)

(assert (=> d!33100 m!155077))

(declare-fun m!155079 () Bool)

(assert (=> d!33100 m!155079))

(declare-fun m!155081 () Bool)

(assert (=> d!33100 m!155081))

(declare-fun m!155083 () Bool)

(assert (=> d!33100 m!155083))

(declare-fun m!155085 () Bool)

(assert (=> d!33100 m!155085))

(declare-fun m!155087 () Bool)

(assert (=> d!33100 m!155087))

(declare-fun m!155089 () Bool)

(assert (=> d!33100 m!155089))

(declare-fun m!155091 () Bool)

(assert (=> d!33100 m!155091))

(declare-fun m!155093 () Bool)

(assert (=> d!33100 m!155093))

(declare-fun m!155095 () Bool)

(assert (=> d!33100 m!155095))

(declare-fun m!155097 () Bool)

(assert (=> d!33100 m!155097))

(assert (=> b!105503 m!154467))

(declare-fun m!155099 () Bool)

(assert (=> b!105503 m!155099))

(declare-fun m!155101 () Bool)

(assert (=> b!105503 m!155101))

(declare-fun m!155103 () Bool)

(assert (=> b!105504 m!155103))

(assert (=> b!105180 d!33100))

(declare-fun d!33102 () Bool)

(declare-fun lt!155688 () tuple2!8684)

(assert (=> d!33102 (= lt!155688 (readBit!0 (BitStream!3925 (buf!2596 (_2!4589 lt!154775)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305))))))

(assert (=> d!33102 (= (readBitPure!0 (BitStream!3925 (buf!2596 (_2!4589 lt!154775)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305))) (tuple2!8659 (_2!4599 lt!155688) (_1!4599 lt!155688)))))

(declare-fun bs!8090 () Bool)

(assert (= bs!8090 d!33102))

(declare-fun m!155105 () Bool)

(assert (=> bs!8090 m!155105))

(assert (=> b!105180 d!33102))

(declare-fun b!105531 () Bool)

(declare-fun lt!155802 () tuple2!8662)

(declare-fun e!69103 () Bool)

(declare-fun lt!155823 () tuple2!8660)

(assert (=> b!105531 (= e!69103 (and (= (_2!4588 lt!155802) v!199) (= (_1!4588 lt!155802) (_2!4587 lt!155823))))))

(declare-fun lt!155790 () (_ BitVec 64))

(assert (=> b!105531 (= lt!155802 (readNLeastSignificantBitsLoopPure!0 (_1!4587 lt!155823) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155790))))

(declare-fun lt!155813 () Unit!6448)

(declare-fun lt!155786 () Unit!6448)

(assert (=> b!105531 (= lt!155813 lt!155786)))

(declare-fun lt!155819 () tuple2!8664)

(declare-fun lt!155800 () (_ BitVec 64))

(assert (=> b!105531 (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!155819)))) ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154777))) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154777))) lt!155800)))

(assert (=> b!105531 (= lt!155786 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4589 lt!154777) (buf!2596 (_2!4589 lt!155819)) lt!155800))))

(declare-fun e!69108 () Bool)

(assert (=> b!105531 e!69108))

(declare-fun res!86904 () Bool)

(assert (=> b!105531 (=> (not res!86904) (not e!69108))))

(assert (=> b!105531 (= res!86904 (and (= (size!2225 (buf!2596 (_2!4589 lt!154777))) (size!2225 (buf!2596 (_2!4589 lt!155819)))) (bvsge lt!155800 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105531 (= lt!155800 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105531 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105531 (= lt!155790 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!105531 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105531 (= lt!155823 (reader!0 (_2!4589 lt!154777) (_2!4589 lt!155819)))))

(declare-fun d!33104 () Bool)

(assert (=> d!33104 e!69103))

(declare-fun res!86902 () Bool)

(assert (=> d!33104 (=> (not res!86902) (not e!69103))))

(assert (=> d!33104 (= res!86902 (= (size!2225 (buf!2596 (_2!4589 lt!154777))) (size!2225 (buf!2596 (_2!4589 lt!155819)))))))

(declare-fun e!69106 () tuple2!8664)

(assert (=> d!33104 (= lt!155819 e!69106)))

(declare-fun c!6513 () Bool)

(assert (=> d!33104 (= c!6513 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!33104 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!33104 (= (appendNLeastSignificantBitsLoop!0 (_2!4589 lt!154777) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!155819)))

(declare-fun b!105532 () Bool)

(declare-fun res!86898 () Bool)

(assert (=> b!105532 (=> (not res!86898) (not e!69103))))

(assert (=> b!105532 (= res!86898 (isPrefixOf!0 (_2!4589 lt!154777) (_2!4589 lt!155819)))))

(declare-fun b!105533 () Bool)

(declare-fun e!69102 () Bool)

(declare-fun lt!155815 () tuple2!8658)

(declare-fun lt!155799 () tuple2!8658)

(assert (=> b!105533 (= e!69102 (= (_2!4586 lt!155815) (_2!4586 lt!155799)))))

(declare-fun bm!1320 () Bool)

(declare-fun lt!155791 () BitStream!3924)

(declare-fun call!1323 () Bool)

(declare-fun lt!155779 () tuple2!8664)

(assert (=> bm!1320 (= call!1323 (isPrefixOf!0 (ite c!6513 (_2!4589 lt!154777) lt!155791) (ite c!6513 (_2!4589 lt!155779) lt!155791)))))

(declare-fun b!105534 () Bool)

(declare-fun e!69107 () (_ BitVec 64))

(assert (=> b!105534 (= e!69107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!105535 () Bool)

(declare-fun res!86899 () Bool)

(declare-fun lt!155805 () tuple2!8664)

(assert (=> b!105535 (= res!86899 (= (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!155805))) (currentByte!5089 (_2!4589 lt!155805)) (currentBit!5084 (_2!4589 lt!155805))) (bvadd (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154777))) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!69105 () Bool)

(assert (=> b!105535 (=> (not res!86899) (not e!69105))))

(declare-fun b!105536 () Bool)

(declare-fun res!86901 () Bool)

(assert (=> b!105536 (= res!86901 (isPrefixOf!0 (_2!4589 lt!154777) (_2!4589 lt!155805)))))

(assert (=> b!105536 (=> (not res!86901) (not e!69105))))

(declare-fun b!105537 () Bool)

(declare-fun e!69104 () Bool)

(declare-fun lt!155785 () tuple2!8658)

(assert (=> b!105537 (= e!69104 (= (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!155785))) (currentByte!5089 (_1!4586 lt!155785)) (currentBit!5084 (_1!4586 lt!155785))) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!155805))) (currentByte!5089 (_2!4589 lt!155805)) (currentBit!5084 (_2!4589 lt!155805)))))))

(declare-fun b!105538 () Bool)

(declare-fun lt!155822 () Unit!6448)

(assert (=> b!105538 (= e!69106 (tuple2!8665 lt!155822 (_2!4589 lt!154777)))))

(assert (=> b!105538 (= lt!155791 (_2!4589 lt!154777))))

(assert (=> b!105538 (= lt!155822 (lemmaIsPrefixRefl!0 lt!155791))))

(assert (=> b!105538 call!1323))

(declare-fun b!105539 () Bool)

(assert (=> b!105539 (= lt!155785 (readBitPure!0 (readerFrom!0 (_2!4589 lt!155805) (currentBit!5084 (_2!4589 lt!154777)) (currentByte!5089 (_2!4589 lt!154777)))))))

(declare-fun lt!155807 () Bool)

(declare-fun res!86903 () Bool)

(assert (=> b!105539 (= res!86903 (and (= (_2!4586 lt!155785) lt!155807) (= (_1!4586 lt!155785) (_2!4589 lt!155805))))))

(assert (=> b!105539 (=> (not res!86903) (not e!69104))))

(assert (=> b!105539 (= e!69105 e!69104)))

(declare-fun b!105540 () Bool)

(assert (=> b!105540 (= e!69108 (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154777)))) ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154777))) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154777))) lt!155800))))

(declare-fun b!105541 () Bool)

(assert (=> b!105541 (= e!69107 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!105542 () Bool)

(declare-fun res!86906 () Bool)

(assert (=> b!105542 (=> (not res!86906) (not e!69103))))

(declare-fun lt!155814 () (_ BitVec 64))

(declare-fun lt!155789 () (_ BitVec 64))

(assert (=> b!105542 (= res!86906 (= (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!155819))) (currentByte!5089 (_2!4589 lt!155819)) (currentBit!5084 (_2!4589 lt!155819))) (bvadd lt!155789 lt!155814)))))

(assert (=> b!105542 (or (not (= (bvand lt!155789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155814 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!155789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!155789 lt!155814) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105542 (= lt!155814 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!105542 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!105542 (= lt!155789 (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154777))) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777))))))

(declare-fun b!105543 () Bool)

(declare-fun Unit!6469 () Unit!6448)

(assert (=> b!105543 (= e!69106 (tuple2!8665 Unit!6469 (_2!4589 lt!155779)))))

(assert (=> b!105543 (= lt!155807 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105543 (= lt!155805 (appendBit!0 (_2!4589 lt!154777) lt!155807))))

(declare-fun res!86900 () Bool)

(assert (=> b!105543 (= res!86900 (= (size!2225 (buf!2596 (_2!4589 lt!154777))) (size!2225 (buf!2596 (_2!4589 lt!155805)))))))

(assert (=> b!105543 (=> (not res!86900) (not e!69105))))

(assert (=> b!105543 e!69105))

(declare-fun lt!155792 () tuple2!8664)

(assert (=> b!105543 (= lt!155792 lt!155805)))

(assert (=> b!105543 (= lt!155779 (appendNLeastSignificantBitsLoop!0 (_2!4589 lt!155792) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!155812 () Unit!6448)

(assert (=> b!105543 (= lt!155812 (lemmaIsPrefixTransitive!0 (_2!4589 lt!154777) (_2!4589 lt!155792) (_2!4589 lt!155779)))))

(assert (=> b!105543 call!1323))

(declare-fun lt!155806 () Unit!6448)

(assert (=> b!105543 (= lt!155806 lt!155812)))

(assert (=> b!105543 (invariant!0 (currentBit!5084 (_2!4589 lt!154777)) (currentByte!5089 (_2!4589 lt!154777)) (size!2225 (buf!2596 (_2!4589 lt!155792))))))

(declare-fun lt!155795 () BitStream!3924)

(assert (=> b!105543 (= lt!155795 (BitStream!3925 (buf!2596 (_2!4589 lt!155792)) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777))))))

(assert (=> b!105543 (invariant!0 (currentBit!5084 lt!155795) (currentByte!5089 lt!155795) (size!2225 (buf!2596 (_2!4589 lt!155779))))))

(declare-fun lt!155782 () BitStream!3924)

(assert (=> b!105543 (= lt!155782 (BitStream!3925 (buf!2596 (_2!4589 lt!155779)) (currentByte!5089 lt!155795) (currentBit!5084 lt!155795)))))

(assert (=> b!105543 (= lt!155815 (readBitPure!0 lt!155795))))

(assert (=> b!105543 (= lt!155799 (readBitPure!0 lt!155782))))

(declare-fun lt!155788 () Unit!6448)

(assert (=> b!105543 (= lt!155788 (readBitPrefixLemma!0 lt!155795 (_2!4589 lt!155779)))))

(declare-fun res!86905 () Bool)

(assert (=> b!105543 (= res!86905 (= (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!155815))) (currentByte!5089 (_1!4586 lt!155815)) (currentBit!5084 (_1!4586 lt!155815))) (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!155799))) (currentByte!5089 (_1!4586 lt!155799)) (currentBit!5084 (_1!4586 lt!155799)))))))

(assert (=> b!105543 (=> (not res!86905) (not e!69102))))

(assert (=> b!105543 e!69102))

(declare-fun lt!155809 () Unit!6448)

(assert (=> b!105543 (= lt!155809 lt!155788)))

(declare-fun lt!155787 () tuple2!8660)

(assert (=> b!105543 (= lt!155787 (reader!0 (_2!4589 lt!154777) (_2!4589 lt!155779)))))

(declare-fun lt!155801 () tuple2!8660)

(assert (=> b!105543 (= lt!155801 (reader!0 (_2!4589 lt!155792) (_2!4589 lt!155779)))))

(declare-fun lt!155820 () tuple2!8658)

(assert (=> b!105543 (= lt!155820 (readBitPure!0 (_1!4587 lt!155787)))))

(assert (=> b!105543 (= (_2!4586 lt!155820) lt!155807)))

(declare-fun lt!155780 () Unit!6448)

(declare-fun Unit!6470 () Unit!6448)

(assert (=> b!105543 (= lt!155780 Unit!6470)))

(declare-fun lt!155810 () (_ BitVec 64))

(assert (=> b!105543 (= lt!155810 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!155793 () (_ BitVec 64))

(assert (=> b!105543 (= lt!155793 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!155794 () Unit!6448)

(assert (=> b!105543 (= lt!155794 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4589 lt!154777) (buf!2596 (_2!4589 lt!155779)) lt!155793))))

(assert (=> b!105543 (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!155779)))) ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154777))) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154777))) lt!155793)))

(declare-fun lt!155804 () Unit!6448)

(assert (=> b!105543 (= lt!155804 lt!155794)))

(declare-fun lt!155783 () tuple2!8662)

(assert (=> b!105543 (= lt!155783 (readNLeastSignificantBitsLoopPure!0 (_1!4587 lt!155787) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155810))))

(declare-fun lt!155817 () (_ BitVec 64))

(assert (=> b!105543 (= lt!155817 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!155821 () Unit!6448)

(assert (=> b!105543 (= lt!155821 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4589 lt!155792) (buf!2596 (_2!4589 lt!155779)) lt!155817))))

(assert (=> b!105543 (validate_offset_bits!1 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!155779)))) ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!155792))) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!155792))) lt!155817)))

(declare-fun lt!155818 () Unit!6448)

(assert (=> b!105543 (= lt!155818 lt!155821)))

(declare-fun lt!155781 () tuple2!8662)

(assert (=> b!105543 (= lt!155781 (readNLeastSignificantBitsLoopPure!0 (_1!4587 lt!155801) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!155810 (ite (_2!4586 lt!155820) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!155784 () tuple2!8662)

(assert (=> b!105543 (= lt!155784 (readNLeastSignificantBitsLoopPure!0 (_1!4587 lt!155787) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155810))))

(declare-fun c!6512 () Bool)

(assert (=> b!105543 (= c!6512 (_2!4586 (readBitPure!0 (_1!4587 lt!155787))))))

(declare-fun lt!155811 () tuple2!8662)

(assert (=> b!105543 (= lt!155811 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4587 lt!155787) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!155810 e!69107)))))

(declare-fun lt!155796 () Unit!6448)

(assert (=> b!105543 (= lt!155796 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4587 lt!155787) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!155810))))

(assert (=> b!105543 (and (= (_2!4588 lt!155784) (_2!4588 lt!155811)) (= (_1!4588 lt!155784) (_1!4588 lt!155811)))))

(declare-fun lt!155797 () Unit!6448)

(assert (=> b!105543 (= lt!155797 lt!155796)))

(assert (=> b!105543 (= (_1!4587 lt!155787) (withMovedBitIndex!0 (_2!4587 lt!155787) (bvsub (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154777))) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777))) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!155779))) (currentByte!5089 (_2!4589 lt!155779)) (currentBit!5084 (_2!4589 lt!155779))))))))

(declare-fun lt!155803 () Unit!6448)

(declare-fun Unit!6471 () Unit!6448)

(assert (=> b!105543 (= lt!155803 Unit!6471)))

(assert (=> b!105543 (= (_1!4587 lt!155801) (withMovedBitIndex!0 (_2!4587 lt!155801) (bvsub (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!155792))) (currentByte!5089 (_2!4589 lt!155792)) (currentBit!5084 (_2!4589 lt!155792))) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!155779))) (currentByte!5089 (_2!4589 lt!155779)) (currentBit!5084 (_2!4589 lt!155779))))))))

(declare-fun lt!155816 () Unit!6448)

(declare-fun Unit!6472 () Unit!6448)

(assert (=> b!105543 (= lt!155816 Unit!6472)))

(assert (=> b!105543 (= (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154777))) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777))) (bvsub (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!155792))) (currentByte!5089 (_2!4589 lt!155792)) (currentBit!5084 (_2!4589 lt!155792))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!155798 () Unit!6448)

(declare-fun Unit!6473 () Unit!6448)

(assert (=> b!105543 (= lt!155798 Unit!6473)))

(assert (=> b!105543 (= (_2!4588 lt!155783) (_2!4588 lt!155781))))

(declare-fun lt!155808 () Unit!6448)

(declare-fun Unit!6474 () Unit!6448)

(assert (=> b!105543 (= lt!155808 Unit!6474)))

(assert (=> b!105543 (= (_1!4588 lt!155783) (_2!4587 lt!155787))))

(assert (= (and d!33104 c!6513) b!105543))

(assert (= (and d!33104 (not c!6513)) b!105538))

(assert (= (and b!105543 res!86900) b!105535))

(assert (= (and b!105535 res!86899) b!105536))

(assert (= (and b!105536 res!86901) b!105539))

(assert (= (and b!105539 res!86903) b!105537))

(assert (= (and b!105543 res!86905) b!105533))

(assert (= (and b!105543 c!6512) b!105541))

(assert (= (and b!105543 (not c!6512)) b!105534))

(assert (= (or b!105543 b!105538) bm!1320))

(assert (= (and d!33104 res!86902) b!105542))

(assert (= (and b!105542 res!86906) b!105532))

(assert (= (and b!105532 res!86898) b!105531))

(assert (= (and b!105531 res!86904) b!105540))

(declare-fun m!155107 () Bool)

(assert (=> b!105535 m!155107))

(assert (=> b!105535 m!154467))

(declare-fun m!155109 () Bool)

(assert (=> b!105536 m!155109))

(declare-fun m!155111 () Bool)

(assert (=> b!105538 m!155111))

(declare-fun m!155113 () Bool)

(assert (=> b!105537 m!155113))

(assert (=> b!105537 m!155107))

(declare-fun m!155115 () Bool)

(assert (=> b!105543 m!155115))

(assert (=> b!105543 m!154467))

(declare-fun m!155117 () Bool)

(assert (=> b!105543 m!155117))

(declare-fun m!155119 () Bool)

(assert (=> b!105543 m!155119))

(declare-fun m!155121 () Bool)

(assert (=> b!105543 m!155121))

(declare-fun m!155123 () Bool)

(assert (=> b!105543 m!155123))

(declare-fun m!155125 () Bool)

(assert (=> b!105543 m!155125))

(declare-fun m!155127 () Bool)

(assert (=> b!105543 m!155127))

(declare-fun m!155129 () Bool)

(assert (=> b!105543 m!155129))

(declare-fun m!155131 () Bool)

(assert (=> b!105543 m!155131))

(declare-fun m!155133 () Bool)

(assert (=> b!105543 m!155133))

(declare-fun m!155135 () Bool)

(assert (=> b!105543 m!155135))

(declare-fun m!155137 () Bool)

(assert (=> b!105543 m!155137))

(declare-fun m!155139 () Bool)

(assert (=> b!105543 m!155139))

(declare-fun m!155141 () Bool)

(assert (=> b!105543 m!155141))

(declare-fun m!155143 () Bool)

(assert (=> b!105543 m!155143))

(declare-fun m!155145 () Bool)

(assert (=> b!105543 m!155145))

(declare-fun m!155147 () Bool)

(assert (=> b!105543 m!155147))

(declare-fun m!155149 () Bool)

(assert (=> b!105543 m!155149))

(declare-fun m!155151 () Bool)

(assert (=> b!105543 m!155151))

(declare-fun m!155153 () Bool)

(assert (=> b!105543 m!155153))

(assert (=> b!105543 m!155139))

(declare-fun m!155155 () Bool)

(assert (=> b!105543 m!155155))

(declare-fun m!155157 () Bool)

(assert (=> b!105543 m!155157))

(declare-fun m!155159 () Bool)

(assert (=> b!105543 m!155159))

(declare-fun m!155161 () Bool)

(assert (=> b!105543 m!155161))

(declare-fun m!155163 () Bool)

(assert (=> b!105543 m!155163))

(declare-fun m!155165 () Bool)

(assert (=> b!105543 m!155165))

(declare-fun m!155167 () Bool)

(assert (=> b!105543 m!155167))

(declare-fun m!155169 () Bool)

(assert (=> b!105531 m!155169))

(declare-fun m!155171 () Bool)

(assert (=> b!105531 m!155171))

(assert (=> b!105531 m!155121))

(declare-fun m!155173 () Bool)

(assert (=> b!105531 m!155173))

(declare-fun m!155175 () Bool)

(assert (=> b!105531 m!155175))

(declare-fun m!155177 () Bool)

(assert (=> b!105539 m!155177))

(assert (=> b!105539 m!155177))

(declare-fun m!155179 () Bool)

(assert (=> b!105539 m!155179))

(declare-fun m!155181 () Bool)

(assert (=> b!105542 m!155181))

(assert (=> b!105542 m!154467))

(declare-fun m!155183 () Bool)

(assert (=> b!105540 m!155183))

(declare-fun m!155185 () Bool)

(assert (=> b!105532 m!155185))

(declare-fun m!155187 () Bool)

(assert (=> bm!1320 m!155187))

(assert (=> b!105180 d!33104))

(declare-fun b!105544 () Bool)

(declare-fun e!69110 () Unit!6448)

(declare-fun Unit!6475 () Unit!6448)

(assert (=> b!105544 (= e!69110 Unit!6475)))

(declare-fun e!69109 () Bool)

(declare-fun lt!155827 () (_ BitVec 64))

(declare-fun lt!155840 () (_ BitVec 64))

(declare-fun b!105545 () Bool)

(declare-fun lt!155839 () tuple2!8660)

(assert (=> b!105545 (= e!69109 (= (_1!4587 lt!155839) (withMovedBitIndex!0 (_2!4587 lt!155839) (bvsub lt!155840 lt!155827))))))

(assert (=> b!105545 (or (= (bvand lt!155840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155827 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155840 lt!155827) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!105545 (= lt!155827 (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154775))) (currentByte!5089 (_2!4589 lt!154775)) (currentBit!5084 (_2!4589 lt!154775))))))

(assert (=> b!105545 (= lt!155840 (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)))))

(declare-fun b!105546 () Bool)

(declare-fun res!86907 () Bool)

(assert (=> b!105546 (=> (not res!86907) (not e!69109))))

(assert (=> b!105546 (= res!86907 (isPrefixOf!0 (_2!4587 lt!155839) (_2!4589 lt!154775)))))

(declare-fun b!105547 () Bool)

(declare-fun lt!155832 () Unit!6448)

(assert (=> b!105547 (= e!69110 lt!155832)))

(declare-fun lt!155841 () (_ BitVec 64))

(assert (=> b!105547 (= lt!155841 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!155838 () (_ BitVec 64))

(assert (=> b!105547 (= lt!155838 (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)))))

(assert (=> b!105547 (= lt!155832 (arrayBitRangesEqSymmetric!0 (buf!2596 thiss!1305) (buf!2596 (_2!4589 lt!154775)) lt!155841 lt!155838))))

(assert (=> b!105547 (arrayBitRangesEq!0 (buf!2596 (_2!4589 lt!154775)) (buf!2596 thiss!1305) lt!155841 lt!155838)))

(declare-fun b!105548 () Bool)

(declare-fun res!86908 () Bool)

(assert (=> b!105548 (=> (not res!86908) (not e!69109))))

(assert (=> b!105548 (= res!86908 (isPrefixOf!0 (_1!4587 lt!155839) thiss!1305))))

(declare-fun d!33106 () Bool)

(assert (=> d!33106 e!69109))

(declare-fun res!86909 () Bool)

(assert (=> d!33106 (=> (not res!86909) (not e!69109))))

(assert (=> d!33106 (= res!86909 (isPrefixOf!0 (_1!4587 lt!155839) (_2!4587 lt!155839)))))

(declare-fun lt!155834 () BitStream!3924)

(assert (=> d!33106 (= lt!155839 (tuple2!8661 lt!155834 (_2!4589 lt!154775)))))

(declare-fun lt!155824 () Unit!6448)

(declare-fun lt!155837 () Unit!6448)

(assert (=> d!33106 (= lt!155824 lt!155837)))

(assert (=> d!33106 (isPrefixOf!0 lt!155834 (_2!4589 lt!154775))))

(assert (=> d!33106 (= lt!155837 (lemmaIsPrefixTransitive!0 lt!155834 (_2!4589 lt!154775) (_2!4589 lt!154775)))))

(declare-fun lt!155826 () Unit!6448)

(declare-fun lt!155836 () Unit!6448)

(assert (=> d!33106 (= lt!155826 lt!155836)))

(assert (=> d!33106 (isPrefixOf!0 lt!155834 (_2!4589 lt!154775))))

(assert (=> d!33106 (= lt!155836 (lemmaIsPrefixTransitive!0 lt!155834 thiss!1305 (_2!4589 lt!154775)))))

(declare-fun lt!155830 () Unit!6448)

(assert (=> d!33106 (= lt!155830 e!69110)))

(declare-fun c!6514 () Bool)

(assert (=> d!33106 (= c!6514 (not (= (size!2225 (buf!2596 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!155828 () Unit!6448)

(declare-fun lt!155842 () Unit!6448)

(assert (=> d!33106 (= lt!155828 lt!155842)))

(assert (=> d!33106 (isPrefixOf!0 (_2!4589 lt!154775) (_2!4589 lt!154775))))

(assert (=> d!33106 (= lt!155842 (lemmaIsPrefixRefl!0 (_2!4589 lt!154775)))))

(declare-fun lt!155835 () Unit!6448)

(declare-fun lt!155843 () Unit!6448)

(assert (=> d!33106 (= lt!155835 lt!155843)))

(assert (=> d!33106 (= lt!155843 (lemmaIsPrefixRefl!0 (_2!4589 lt!154775)))))

(declare-fun lt!155831 () Unit!6448)

(declare-fun lt!155829 () Unit!6448)

(assert (=> d!33106 (= lt!155831 lt!155829)))

(assert (=> d!33106 (isPrefixOf!0 lt!155834 lt!155834)))

(assert (=> d!33106 (= lt!155829 (lemmaIsPrefixRefl!0 lt!155834))))

(declare-fun lt!155825 () Unit!6448)

(declare-fun lt!155833 () Unit!6448)

(assert (=> d!33106 (= lt!155825 lt!155833)))

(assert (=> d!33106 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!33106 (= lt!155833 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!33106 (= lt!155834 (BitStream!3925 (buf!2596 (_2!4589 lt!154775)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)))))

(assert (=> d!33106 (isPrefixOf!0 thiss!1305 (_2!4589 lt!154775))))

(assert (=> d!33106 (= (reader!0 thiss!1305 (_2!4589 lt!154775)) lt!155839)))

(assert (= (and d!33106 c!6514) b!105547))

(assert (= (and d!33106 (not c!6514)) b!105544))

(assert (= (and d!33106 res!86909) b!105548))

(assert (= (and b!105548 res!86908) b!105546))

(assert (= (and b!105546 res!86907) b!105545))

(declare-fun m!155189 () Bool)

(assert (=> b!105545 m!155189))

(assert (=> b!105545 m!154409))

(assert (=> b!105545 m!154401))

(declare-fun m!155191 () Bool)

(assert (=> b!105546 m!155191))

(assert (=> d!33106 m!155077))

(declare-fun m!155193 () Bool)

(assert (=> d!33106 m!155193))

(declare-fun m!155195 () Bool)

(assert (=> d!33106 m!155195))

(assert (=> d!33106 m!154415))

(declare-fun m!155197 () Bool)

(assert (=> d!33106 m!155197))

(declare-fun m!155199 () Bool)

(assert (=> d!33106 m!155199))

(declare-fun m!155201 () Bool)

(assert (=> d!33106 m!155201))

(declare-fun m!155203 () Bool)

(assert (=> d!33106 m!155203))

(declare-fun m!155205 () Bool)

(assert (=> d!33106 m!155205))

(declare-fun m!155207 () Bool)

(assert (=> d!33106 m!155207))

(assert (=> d!33106 m!155097))

(assert (=> b!105547 m!154401))

(declare-fun m!155209 () Bool)

(assert (=> b!105547 m!155209))

(declare-fun m!155211 () Bool)

(assert (=> b!105547 m!155211))

(declare-fun m!155213 () Bool)

(assert (=> b!105548 m!155213))

(assert (=> b!105180 d!33106))

(declare-fun d!33108 () Bool)

(declare-fun res!86917 () Bool)

(declare-fun e!69115 () Bool)

(assert (=> d!33108 (=> (not res!86917) (not e!69115))))

(assert (=> d!33108 (= res!86917 (= (size!2225 (buf!2596 thiss!1305)) (size!2225 (buf!2596 (_2!4589 lt!154775)))))))

(assert (=> d!33108 (= (isPrefixOf!0 thiss!1305 (_2!4589 lt!154775)) e!69115)))

(declare-fun b!105555 () Bool)

(declare-fun res!86918 () Bool)

(assert (=> b!105555 (=> (not res!86918) (not e!69115))))

(assert (=> b!105555 (= res!86918 (bvsle (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154775))) (currentByte!5089 (_2!4589 lt!154775)) (currentBit!5084 (_2!4589 lt!154775)))))))

(declare-fun b!105556 () Bool)

(declare-fun e!69116 () Bool)

(assert (=> b!105556 (= e!69115 e!69116)))

(declare-fun res!86916 () Bool)

(assert (=> b!105556 (=> res!86916 e!69116)))

(assert (=> b!105556 (= res!86916 (= (size!2225 (buf!2596 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!105557 () Bool)

(assert (=> b!105557 (= e!69116 (arrayBitRangesEq!0 (buf!2596 thiss!1305) (buf!2596 (_2!4589 lt!154775)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305))))))

(assert (= (and d!33108 res!86917) b!105555))

(assert (= (and b!105555 res!86918) b!105556))

(assert (= (and b!105556 (not res!86916)) b!105557))

(assert (=> b!105555 m!154401))

(assert (=> b!105555 m!154409))

(assert (=> b!105557 m!154401))

(assert (=> b!105557 m!154401))

(declare-fun m!155215 () Bool)

(assert (=> b!105557 m!155215))

(assert (=> b!105180 d!33108))

(declare-fun d!33110 () Bool)

(declare-fun e!69117 () Bool)

(assert (=> d!33110 e!69117))

(declare-fun res!86920 () Bool)

(assert (=> d!33110 (=> (not res!86920) (not e!69117))))

(declare-fun lt!155847 () (_ BitVec 64))

(declare-fun lt!155848 () (_ BitVec 64))

(declare-fun lt!155844 () (_ BitVec 64))

(assert (=> d!33110 (= res!86920 (= lt!155844 (bvsub lt!155847 lt!155848)))))

(assert (=> d!33110 (or (= (bvand lt!155847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155848 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155847 lt!155848) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33110 (= lt!155848 (remainingBits!0 ((_ sign_extend 32) (size!2225 (buf!2596 (_1!4586 lt!154784)))) ((_ sign_extend 32) (currentByte!5089 (_1!4586 lt!154784))) ((_ sign_extend 32) (currentBit!5084 (_1!4586 lt!154784)))))))

(declare-fun lt!155846 () (_ BitVec 64))

(declare-fun lt!155849 () (_ BitVec 64))

(assert (=> d!33110 (= lt!155847 (bvmul lt!155846 lt!155849))))

(assert (=> d!33110 (or (= lt!155846 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155849 (bvsdiv (bvmul lt!155846 lt!155849) lt!155846)))))

(assert (=> d!33110 (= lt!155849 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33110 (= lt!155846 ((_ sign_extend 32) (size!2225 (buf!2596 (_1!4586 lt!154784)))))))

(assert (=> d!33110 (= lt!155844 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5089 (_1!4586 lt!154784))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5084 (_1!4586 lt!154784)))))))

(assert (=> d!33110 (invariant!0 (currentBit!5084 (_1!4586 lt!154784)) (currentByte!5089 (_1!4586 lt!154784)) (size!2225 (buf!2596 (_1!4586 lt!154784))))))

(assert (=> d!33110 (= (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!154784))) (currentByte!5089 (_1!4586 lt!154784)) (currentBit!5084 (_1!4586 lt!154784))) lt!155844)))

(declare-fun b!105558 () Bool)

(declare-fun res!86919 () Bool)

(assert (=> b!105558 (=> (not res!86919) (not e!69117))))

(assert (=> b!105558 (= res!86919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155844))))

(declare-fun b!105559 () Bool)

(declare-fun lt!155845 () (_ BitVec 64))

(assert (=> b!105559 (= e!69117 (bvsle lt!155844 (bvmul lt!155845 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105559 (or (= lt!155845 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155845 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155845)))))

(assert (=> b!105559 (= lt!155845 ((_ sign_extend 32) (size!2225 (buf!2596 (_1!4586 lt!154784)))))))

(assert (= (and d!33110 res!86920) b!105558))

(assert (= (and b!105558 res!86919) b!105559))

(declare-fun m!155217 () Bool)

(assert (=> d!33110 m!155217))

(declare-fun m!155219 () Bool)

(assert (=> d!33110 m!155219))

(assert (=> b!105180 d!33110))

(declare-fun d!33112 () Bool)

(declare-fun e!69118 () Bool)

(assert (=> d!33112 e!69118))

(declare-fun res!86922 () Bool)

(assert (=> d!33112 (=> (not res!86922) (not e!69118))))

(declare-fun lt!155850 () (_ BitVec 64))

(declare-fun lt!155853 () (_ BitVec 64))

(declare-fun lt!155854 () (_ BitVec 64))

(assert (=> d!33112 (= res!86922 (= lt!155850 (bvsub lt!155853 lt!155854)))))

(assert (=> d!33112 (or (= (bvand lt!155853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155854 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155853 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155853 lt!155854) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33112 (= lt!155854 (remainingBits!0 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154777)))) ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154777))) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154777)))))))

(declare-fun lt!155852 () (_ BitVec 64))

(declare-fun lt!155855 () (_ BitVec 64))

(assert (=> d!33112 (= lt!155853 (bvmul lt!155852 lt!155855))))

(assert (=> d!33112 (or (= lt!155852 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155855 (bvsdiv (bvmul lt!155852 lt!155855) lt!155852)))))

(assert (=> d!33112 (= lt!155855 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33112 (= lt!155852 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154777)))))))

(assert (=> d!33112 (= lt!155850 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5089 (_2!4589 lt!154777))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5084 (_2!4589 lt!154777)))))))

(assert (=> d!33112 (invariant!0 (currentBit!5084 (_2!4589 lt!154777)) (currentByte!5089 (_2!4589 lt!154777)) (size!2225 (buf!2596 (_2!4589 lt!154777))))))

(assert (=> d!33112 (= (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154777))) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777))) lt!155850)))

(declare-fun b!105560 () Bool)

(declare-fun res!86921 () Bool)

(assert (=> b!105560 (=> (not res!86921) (not e!69118))))

(assert (=> b!105560 (= res!86921 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155850))))

(declare-fun b!105561 () Bool)

(declare-fun lt!155851 () (_ BitVec 64))

(assert (=> b!105561 (= e!69118 (bvsle lt!155850 (bvmul lt!155851 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105561 (or (= lt!155851 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155851 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155851)))))

(assert (=> b!105561 (= lt!155851 ((_ sign_extend 32) (size!2225 (buf!2596 (_2!4589 lt!154777)))))))

(assert (= (and d!33112 res!86922) b!105560))

(assert (= (and b!105560 res!86921) b!105561))

(declare-fun m!155221 () Bool)

(assert (=> d!33112 m!155221))

(declare-fun m!155223 () Bool)

(assert (=> d!33112 m!155223))

(assert (=> b!105184 d!33112))

(assert (=> b!105184 d!33070))

(declare-fun d!33114 () Bool)

(assert (=> d!33114 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305) (size!2225 (buf!2596 thiss!1305))))))

(declare-fun bs!8091 () Bool)

(assert (= bs!8091 d!33114))

(assert (=> bs!8091 m!155025))

(assert (=> start!20780 d!33114))

(declare-fun d!33116 () Bool)

(assert (=> d!33116 (= (invariant!0 (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305) (size!2225 (buf!2596 (_2!4589 lt!154777)))) (and (bvsge (currentBit!5084 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5084 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5089 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5089 thiss!1305) (size!2225 (buf!2596 (_2!4589 lt!154777)))) (and (= (currentBit!5084 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5089 thiss!1305) (size!2225 (buf!2596 (_2!4589 lt!154777))))))))))

(assert (=> b!105187 d!33116))

(declare-fun d!33118 () Bool)

(declare-fun lt!155856 () tuple2!8684)

(assert (=> d!33118 (= lt!155856 (readBit!0 (readerFrom!0 (_2!4589 lt!154777) (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305))))))

(assert (=> d!33118 (= (readBitPure!0 (readerFrom!0 (_2!4589 lt!154777) (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305))) (tuple2!8659 (_2!4599 lt!155856) (_1!4599 lt!155856)))))

(declare-fun bs!8092 () Bool)

(assert (= bs!8092 d!33118))

(assert (=> bs!8092 m!154463))

(declare-fun m!155225 () Bool)

(assert (=> bs!8092 m!155225))

(assert (=> b!105185 d!33118))

(declare-fun d!33120 () Bool)

(declare-fun e!69121 () Bool)

(assert (=> d!33120 e!69121))

(declare-fun res!86926 () Bool)

(assert (=> d!33120 (=> (not res!86926) (not e!69121))))

(assert (=> d!33120 (= res!86926 (invariant!0 (currentBit!5084 (_2!4589 lt!154777)) (currentByte!5089 (_2!4589 lt!154777)) (size!2225 (buf!2596 (_2!4589 lt!154777)))))))

(assert (=> d!33120 (= (readerFrom!0 (_2!4589 lt!154777) (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305)) (BitStream!3925 (buf!2596 (_2!4589 lt!154777)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)))))

(declare-fun b!105564 () Bool)

(assert (=> b!105564 (= e!69121 (invariant!0 (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305) (size!2225 (buf!2596 (_2!4589 lt!154777)))))))

(assert (= (and d!33120 res!86926) b!105564))

(assert (=> d!33120 m!155223))

(assert (=> b!105564 m!154459))

(assert (=> b!105185 d!33120))

(declare-fun d!33122 () Bool)

(assert (=> d!33122 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!105190 d!33122))

(declare-fun d!33124 () Bool)

(declare-fun e!69122 () Bool)

(assert (=> d!33124 e!69122))

(declare-fun res!86928 () Bool)

(assert (=> d!33124 (=> (not res!86928) (not e!69122))))

(declare-fun lt!155857 () (_ BitVec 64))

(declare-fun lt!155861 () (_ BitVec 64))

(declare-fun lt!155860 () (_ BitVec 64))

(assert (=> d!33124 (= res!86928 (= lt!155857 (bvsub lt!155860 lt!155861)))))

(assert (=> d!33124 (or (= (bvand lt!155860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!155861 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!155860 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!155860 lt!155861) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33124 (= lt!155861 (remainingBits!0 ((_ sign_extend 32) (size!2225 (buf!2596 (_1!4586 lt!154790)))) ((_ sign_extend 32) (currentByte!5089 (_1!4586 lt!154790))) ((_ sign_extend 32) (currentBit!5084 (_1!4586 lt!154790)))))))

(declare-fun lt!155859 () (_ BitVec 64))

(declare-fun lt!155862 () (_ BitVec 64))

(assert (=> d!33124 (= lt!155860 (bvmul lt!155859 lt!155862))))

(assert (=> d!33124 (or (= lt!155859 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!155862 (bvsdiv (bvmul lt!155859 lt!155862) lt!155859)))))

(assert (=> d!33124 (= lt!155862 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33124 (= lt!155859 ((_ sign_extend 32) (size!2225 (buf!2596 (_1!4586 lt!154790)))))))

(assert (=> d!33124 (= lt!155857 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5089 (_1!4586 lt!154790))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5084 (_1!4586 lt!154790)))))))

(assert (=> d!33124 (invariant!0 (currentBit!5084 (_1!4586 lt!154790)) (currentByte!5089 (_1!4586 lt!154790)) (size!2225 (buf!2596 (_1!4586 lt!154790))))))

(assert (=> d!33124 (= (bitIndex!0 (size!2225 (buf!2596 (_1!4586 lt!154790))) (currentByte!5089 (_1!4586 lt!154790)) (currentBit!5084 (_1!4586 lt!154790))) lt!155857)))

(declare-fun b!105565 () Bool)

(declare-fun res!86927 () Bool)

(assert (=> b!105565 (=> (not res!86927) (not e!69122))))

(assert (=> b!105565 (= res!86927 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!155857))))

(declare-fun b!105566 () Bool)

(declare-fun lt!155858 () (_ BitVec 64))

(assert (=> b!105566 (= e!69122 (bvsle lt!155857 (bvmul lt!155858 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!105566 (or (= lt!155858 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!155858 #b0000000000000000000000000000000000000000000000000000000000001000) lt!155858)))))

(assert (=> b!105566 (= lt!155858 ((_ sign_extend 32) (size!2225 (buf!2596 (_1!4586 lt!154790)))))))

(assert (= (and d!33124 res!86928) b!105565))

(assert (= (and b!105565 res!86927) b!105566))

(declare-fun m!155227 () Bool)

(assert (=> d!33124 m!155227))

(declare-fun m!155229 () Bool)

(assert (=> d!33124 m!155229))

(assert (=> b!105179 d!33124))

(declare-fun d!33126 () Bool)

(assert (=> d!33126 (= (invariant!0 (currentBit!5084 thiss!1305) (currentByte!5089 thiss!1305) (size!2225 (buf!2596 (_2!4589 lt!154775)))) (and (bvsge (currentBit!5084 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5084 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5089 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5089 thiss!1305) (size!2225 (buf!2596 (_2!4589 lt!154775)))) (and (= (currentBit!5084 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5089 thiss!1305) (size!2225 (buf!2596 (_2!4589 lt!154775))))))))))

(assert (=> b!105189 d!33126))

(declare-fun d!33128 () Bool)

(declare-fun res!86930 () Bool)

(declare-fun e!69123 () Bool)

(assert (=> d!33128 (=> (not res!86930) (not e!69123))))

(assert (=> d!33128 (= res!86930 (= (size!2225 (buf!2596 thiss!1305)) (size!2225 (buf!2596 (_2!4589 lt!154777)))))))

(assert (=> d!33128 (= (isPrefixOf!0 thiss!1305 (_2!4589 lt!154777)) e!69123)))

(declare-fun b!105567 () Bool)

(declare-fun res!86931 () Bool)

(assert (=> b!105567 (=> (not res!86931) (not e!69123))))

(assert (=> b!105567 (= res!86931 (bvsle (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305)) (bitIndex!0 (size!2225 (buf!2596 (_2!4589 lt!154777))) (currentByte!5089 (_2!4589 lt!154777)) (currentBit!5084 (_2!4589 lt!154777)))))))

(declare-fun b!105568 () Bool)

(declare-fun e!69124 () Bool)

(assert (=> b!105568 (= e!69123 e!69124)))

(declare-fun res!86929 () Bool)

(assert (=> b!105568 (=> res!86929 e!69124)))

(assert (=> b!105568 (= res!86929 (= (size!2225 (buf!2596 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!105569 () Bool)

(assert (=> b!105569 (= e!69124 (arrayBitRangesEq!0 (buf!2596 thiss!1305) (buf!2596 (_2!4589 lt!154777)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2225 (buf!2596 thiss!1305)) (currentByte!5089 thiss!1305) (currentBit!5084 thiss!1305))))))

(assert (= (and d!33128 res!86930) b!105567))

(assert (= (and b!105567 res!86931) b!105568))

(assert (= (and b!105568 (not res!86929)) b!105569))

(assert (=> b!105567 m!154401))

(assert (=> b!105567 m!154467))

(assert (=> b!105569 m!154401))

(assert (=> b!105569 m!154401))

(declare-fun m!155231 () Bool)

(assert (=> b!105569 m!155231))

(assert (=> b!105188 d!33128))

(check-sat (not b!105504) (not d!33100) (not b!105536) (not b!105567) (not d!33124) (not b!105548) (not d!33062) (not d!33064) (not d!33086) (not b!105547) (not d!33098) (not b!105545) (not d!33090) (not b!105569) (not d!33096) (not b!105531) (not b!105540) (not b!105502) (not d!33084) (not d!33110) (not b!105486) (not d!33078) (not b!105555) (not d!33076) (not d!33058) (not d!33118) (not b!105469) (not b!105539) (not b!105538) (not d!33074) (not d!33066) (not b!105557) (not d!33102) (not d!33092) (not bm!1320) (not d!33106) (not b!105564) (not d!33112) (not d!33082) (not b!105543) (not b!105537) (not b!105546) (not b!105535) (not b!105488) (not b!105487) (not d!33114) (not d!33056) (not b!105542) (not b!105532) (not d!33070) (not d!33120) (not b!105501) (not b!105503) (not d!33080) (not d!33088) (not b!105489))
(check-sat)

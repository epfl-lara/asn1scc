; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36414 () Bool)

(assert start!36414)

(declare-fun res!139474 () Bool)

(declare-fun e!116225 () Bool)

(assert (=> start!36414 (=> (not res!139474) (not e!116225))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!36414 (= res!139474 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36414 e!116225))

(assert (=> start!36414 true))

(declare-datatypes ((array!8684 0))(
  ( (array!8685 (arr!4777 (Array (_ BitVec 32) (_ BitVec 8))) (size!3856 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6868 0))(
  ( (BitStream!6869 (buf!4308 array!8684) (currentByte!8153 (_ BitVec 32)) (currentBit!8148 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6868)

(declare-fun e!116226 () Bool)

(declare-fun inv!12 (BitStream!6868) Bool)

(assert (=> start!36414 (and (inv!12 thiss!1577) e!116226)))

(declare-fun b!167511 () Bool)

(declare-fun e!116224 () Bool)

(declare-fun e!116227 () Bool)

(assert (=> b!167511 (= e!116224 e!116227)))

(declare-fun res!139471 () Bool)

(assert (=> b!167511 (=> (not res!139471) (not e!116227))))

(declare-fun lt!260800 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!167511 (= res!139471 (= (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260800) (bvadd (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)) ((_ sign_extend 32) nBits!511))))))

(declare-fun lt!260787 () array!8684)

(declare-fun lt!260797 () BitStream!6868)

(assert (=> b!167511 (= lt!260797 (BitStream!6869 lt!260787 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260800))))

(declare-fun b!167512 () Bool)

(declare-fun res!139473 () Bool)

(assert (=> b!167512 (=> (not res!139473) (not e!116227))))

(declare-fun isPrefixOf!0 (BitStream!6868 BitStream!6868) Bool)

(assert (=> b!167512 (= res!139473 (isPrefixOf!0 thiss!1577 lt!260797))))

(declare-fun b!167513 () Bool)

(declare-fun array_inv!3597 (array!8684) Bool)

(assert (=> b!167513 (= e!116226 (array_inv!3597 (buf!4308 thiss!1577)))))

(declare-fun b!167514 () Bool)

(declare-fun e!116229 () Bool)

(assert (=> b!167514 (= e!116229 (not e!116224))))

(declare-fun res!139472 () Bool)

(assert (=> b!167514 (=> res!139472 e!116224)))

(declare-fun lt!260795 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167514 (= res!139472 (not (byteRangesEq!0 (select (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577)) lt!260795 #b00000000000000000000000000000000 lt!260800)))))

(declare-fun arrayRangesEq!685 (array!8684 array!8684 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167514 (arrayRangesEq!685 (buf!4308 thiss!1577) lt!260787 #b00000000000000000000000000000000 (currentByte!8153 thiss!1577))))

(declare-datatypes ((Unit!11660 0))(
  ( (Unit!11661) )
))
(declare-fun lt!260793 () Unit!11660)

(declare-fun lt!260790 () array!8684)

(declare-fun arrayRangesEqTransitive!187 (array!8684 array!8684 array!8684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11660)

(assert (=> b!167514 (= lt!260793 (arrayRangesEqTransitive!187 (buf!4308 thiss!1577) lt!260790 lt!260787 #b00000000000000000000000000000000 (currentByte!8153 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (=> b!167514 (arrayRangesEq!685 lt!260790 lt!260787 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)))))

(declare-fun lt!260798 () Unit!11660)

(declare-fun lt!260788 () (_ BitVec 8))

(declare-fun arrayUpdatedAtPrefixLemma!293 (array!8684 (_ BitVec 32) (_ BitVec 8)) Unit!11660)

(assert (=> b!167514 (= lt!260798 (arrayUpdatedAtPrefixLemma!293 lt!260790 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788))))

(assert (=> b!167514 (arrayRangesEq!685 (buf!4308 thiss!1577) (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8153 thiss!1577))))

(declare-fun lt!260799 () Unit!11660)

(assert (=> b!167514 (= lt!260799 (arrayUpdatedAtPrefixLemma!293 (buf!4308 thiss!1577) (currentByte!8153 thiss!1577) lt!260795))))

(declare-fun lt!260789 () (_ BitVec 32))

(assert (=> b!167514 (= lt!260795 (select (store (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8148 thiss!1577)))))))) (bvlshr (bvand lt!260789 #b00000000000000000000000011111111) lt!260800)))) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) (currentByte!8153 thiss!1577)))))

(assert (=> b!167514 (= lt!260787 (array!8685 (store (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8148 thiss!1577)))))))) (bvlshr (bvand lt!260789 #b00000000000000000000000011111111) lt!260800)))) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) (size!3856 (buf!4308 thiss!1577))))))

(declare-fun lt!260791 () (_ BitVec 32))

(assert (=> b!167514 (= lt!260788 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8148 thiss!1577)))))))) (bvlshr (bvand lt!260789 #b00000000000000000000000011111111) lt!260800)))) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260791))) (bvshl lt!260789 lt!260791))))))

(assert (=> b!167514 (= lt!260791 (bvsub #b00000000000000000000000000001000 lt!260800))))

(assert (=> b!167514 (= lt!260790 (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8148 thiss!1577)))))))) (bvlshr (bvand lt!260789 #b00000000000000000000000011111111) lt!260800)))) (size!3856 (buf!4308 thiss!1577))))))

(declare-fun lt!260792 () (_ BitVec 8))

(assert (=> b!167514 (= lt!260789 ((_ sign_extend 24) lt!260792))))

(assert (=> b!167514 (= lt!260800 (bvsub (bvadd (currentBit!8148 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167515 () Bool)

(declare-datatypes ((tuple2!14612 0))(
  ( (tuple2!14613 (_1!7903 BitStream!6868) (_2!7903 BitStream!6868)) )
))
(declare-fun lt!260794 () tuple2!14612)

(declare-datatypes ((tuple2!14614 0))(
  ( (tuple2!14615 (_1!7904 BitStream!6868) (_2!7904 (_ BitVec 8))) )
))
(declare-fun lt!260796 () tuple2!14614)

(assert (=> b!167515 (= e!116227 (and (= ((_ sign_extend 24) (_2!7904 lt!260796)) ((_ sign_extend 24) lt!260792)) (= (_1!7904 lt!260796) (_2!7903 lt!260794))))))

(declare-fun readPartialBytePure!0 (BitStream!6868 (_ BitVec 32)) tuple2!14614)

(assert (=> b!167515 (= lt!260796 (readPartialBytePure!0 (_1!7903 lt!260794) nBits!511))))

(declare-fun reader!0 (BitStream!6868 BitStream!6868) tuple2!14612)

(assert (=> b!167515 (= lt!260794 (reader!0 thiss!1577 lt!260797))))

(declare-fun b!167516 () Bool)

(declare-fun res!139475 () Bool)

(assert (=> b!167516 (=> (not res!139475) (not e!116225))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167516 (= res!139475 (validate_offset_bits!1 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))) ((_ sign_extend 32) (currentByte!8153 thiss!1577)) ((_ sign_extend 32) (currentBit!8148 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!167517 () Bool)

(assert (=> b!167517 (= e!116225 e!116229)))

(declare-fun res!139470 () Bool)

(assert (=> b!167517 (=> (not res!139470) (not e!116229))))

(assert (=> b!167517 (= res!139470 (bvsgt (bvadd (currentBit!8148 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!167517 (= lt!260792 ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))))))

(assert (= (and start!36414 res!139474) b!167516))

(assert (= (and b!167516 res!139475) b!167517))

(assert (= (and b!167517 res!139470) b!167514))

(assert (= (and b!167514 (not res!139472)) b!167511))

(assert (= (and b!167511 res!139471) b!167512))

(assert (= (and b!167512 res!139473) b!167515))

(assert (= start!36414 b!167513))

(declare-fun m!266631 () Bool)

(assert (=> b!167513 m!266631))

(declare-fun m!266633 () Bool)

(assert (=> b!167514 m!266633))

(declare-fun m!266635 () Bool)

(assert (=> b!167514 m!266635))

(assert (=> b!167514 m!266635))

(declare-fun m!266637 () Bool)

(assert (=> b!167514 m!266637))

(declare-fun m!266639 () Bool)

(assert (=> b!167514 m!266639))

(declare-fun m!266641 () Bool)

(assert (=> b!167514 m!266641))

(declare-fun m!266643 () Bool)

(assert (=> b!167514 m!266643))

(declare-fun m!266645 () Bool)

(assert (=> b!167514 m!266645))

(declare-fun m!266647 () Bool)

(assert (=> b!167514 m!266647))

(declare-fun m!266649 () Bool)

(assert (=> b!167514 m!266649))

(declare-fun m!266651 () Bool)

(assert (=> b!167514 m!266651))

(declare-fun m!266653 () Bool)

(assert (=> b!167514 m!266653))

(declare-fun m!266655 () Bool)

(assert (=> b!167514 m!266655))

(declare-fun m!266657 () Bool)

(assert (=> b!167514 m!266657))

(declare-fun m!266659 () Bool)

(assert (=> b!167514 m!266659))

(declare-fun m!266661 () Bool)

(assert (=> b!167514 m!266661))

(declare-fun m!266663 () Bool)

(assert (=> b!167516 m!266663))

(declare-fun m!266665 () Bool)

(assert (=> b!167515 m!266665))

(declare-fun m!266667 () Bool)

(assert (=> b!167515 m!266667))

(declare-fun m!266669 () Bool)

(assert (=> b!167512 m!266669))

(declare-fun m!266671 () Bool)

(assert (=> b!167511 m!266671))

(declare-fun m!266673 () Bool)

(assert (=> b!167511 m!266673))

(declare-fun m!266675 () Bool)

(assert (=> start!36414 m!266675))

(declare-fun m!266677 () Bool)

(assert (=> b!167517 m!266677))

(push 1)

(assert (not b!167516))

(assert (not b!167515))

(assert (not b!167514))

(assert (not b!167512))

(assert (not b!167513))

(assert (not b!167511))

(assert (not start!36414))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58699 () Bool)

(declare-fun res!139518 () Bool)

(declare-fun e!116271 () Bool)

(assert (=> d!58699 (=> (not res!139518) (not e!116271))))

(assert (=> d!58699 (= res!139518 (= (size!3856 (buf!4308 thiss!1577)) (size!3856 (buf!4308 lt!260797))))))

(assert (=> d!58699 (= (isPrefixOf!0 thiss!1577 lt!260797) e!116271)))

(declare-fun b!167566 () Bool)

(declare-fun res!139520 () Bool)

(assert (=> b!167566 (=> (not res!139520) (not e!116271))))

(assert (=> b!167566 (= res!139520 (bvsle (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)) (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797))))))

(declare-fun b!167567 () Bool)

(declare-fun e!116270 () Bool)

(assert (=> b!167567 (= e!116271 e!116270)))

(declare-fun res!139519 () Bool)

(assert (=> b!167567 (=> res!139519 e!116270)))

(assert (=> b!167567 (= res!139519 (= (size!3856 (buf!4308 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!167568 () Bool)

(declare-fun arrayBitRangesEq!0 (array!8684 array!8684 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167568 (= e!116270 (arrayBitRangesEq!0 (buf!4308 thiss!1577) (buf!4308 lt!260797) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))))))

(assert (= (and d!58699 res!139518) b!167566))

(assert (= (and b!167566 res!139520) b!167567))

(assert (= (and b!167567 (not res!139519)) b!167568))

(assert (=> b!167566 m!266673))

(declare-fun m!266775 () Bool)

(assert (=> b!167566 m!266775))

(assert (=> b!167568 m!266673))

(assert (=> b!167568 m!266673))

(declare-fun m!266777 () Bool)

(assert (=> b!167568 m!266777))

(assert (=> b!167512 d!58699))

(declare-fun d!58701 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58701 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))) ((_ sign_extend 32) (currentByte!8153 thiss!1577)) ((_ sign_extend 32) (currentBit!8148 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))) ((_ sign_extend 32) (currentByte!8153 thiss!1577)) ((_ sign_extend 32) (currentBit!8148 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14574 () Bool)

(assert (= bs!14574 d!58701))

(declare-fun m!266779 () Bool)

(assert (=> bs!14574 m!266779))

(assert (=> b!167516 d!58701))

(declare-fun d!58703 () Bool)

(declare-fun e!116282 () Bool)

(assert (=> d!58703 e!116282))

(declare-fun res!139534 () Bool)

(assert (=> d!58703 (=> (not res!139534) (not e!116282))))

(declare-fun lt!260903 () (_ BitVec 64))

(declare-fun lt!260900 () (_ BitVec 64))

(declare-fun lt!260904 () (_ BitVec 64))

(assert (=> d!58703 (= res!139534 (= lt!260900 (bvsub lt!260904 lt!260903)))))

(assert (=> d!58703 (or (= (bvand lt!260904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!260903 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!260904 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!260904 lt!260903) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58703 (= lt!260903 (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) ((_ sign_extend 32) lt!260800)))))

(declare-fun lt!260901 () (_ BitVec 64))

(declare-fun lt!260899 () (_ BitVec 64))

(assert (=> d!58703 (= lt!260904 (bvmul lt!260901 lt!260899))))

(assert (=> d!58703 (or (= lt!260901 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!260899 (bvsdiv (bvmul lt!260901 lt!260899) lt!260901)))))

(assert (=> d!58703 (= lt!260899 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58703 (= lt!260901 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))))))

(assert (=> d!58703 (= lt!260900 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!260800)))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58703 (invariant!0 lt!260800 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) (size!3856 (buf!4308 thiss!1577)))))

(assert (=> d!58703 (= (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260800) lt!260900)))

(declare-fun b!167581 () Bool)

(declare-fun res!139533 () Bool)

(assert (=> b!167581 (=> (not res!139533) (not e!116282))))

(assert (=> b!167581 (= res!139533 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!260900))))

(declare-fun b!167582 () Bool)

(declare-fun lt!260902 () (_ BitVec 64))

(assert (=> b!167582 (= e!116282 (bvsle lt!260900 (bvmul lt!260902 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167582 (or (= lt!260902 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!260902 #b0000000000000000000000000000000000000000000000000000000000001000) lt!260902)))))

(assert (=> b!167582 (= lt!260902 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))))))

(assert (= (and d!58703 res!139534) b!167581))

(assert (= (and b!167581 res!139533) b!167582))

(declare-fun m!266787 () Bool)

(assert (=> d!58703 m!266787))

(declare-fun m!266789 () Bool)

(assert (=> d!58703 m!266789))

(assert (=> b!167511 d!58703))

(declare-fun d!58709 () Bool)

(declare-fun e!116284 () Bool)

(assert (=> d!58709 e!116284))

(declare-fun res!139537 () Bool)

(assert (=> d!58709 (=> (not res!139537) (not e!116284))))

(declare-fun lt!260911 () (_ BitVec 64))

(declare-fun lt!260907 () (_ BitVec 64))

(declare-fun lt!260910 () (_ BitVec 64))

(assert (=> d!58709 (= res!139537 (= lt!260907 (bvsub lt!260911 lt!260910)))))

(assert (=> d!58709 (or (= (bvand lt!260911 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!260910 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!260911 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!260911 lt!260910) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58709 (= lt!260910 (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))) ((_ sign_extend 32) (currentByte!8153 thiss!1577)) ((_ sign_extend 32) (currentBit!8148 thiss!1577))))))

(declare-fun lt!260908 () (_ BitVec 64))

(declare-fun lt!260906 () (_ BitVec 64))

(assert (=> d!58709 (= lt!260911 (bvmul lt!260908 lt!260906))))

(assert (=> d!58709 (or (= lt!260908 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!260906 (bvsdiv (bvmul lt!260908 lt!260906) lt!260908)))))

(assert (=> d!58709 (= lt!260906 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58709 (= lt!260908 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))))))

(assert (=> d!58709 (= lt!260907 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8153 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8148 thiss!1577))))))

(assert (=> d!58709 (invariant!0 (currentBit!8148 thiss!1577) (currentByte!8153 thiss!1577) (size!3856 (buf!4308 thiss!1577)))))

(assert (=> d!58709 (= (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)) lt!260907)))

(declare-fun b!167584 () Bool)

(declare-fun res!139536 () Bool)

(assert (=> b!167584 (=> (not res!139536) (not e!116284))))

(assert (=> b!167584 (= res!139536 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!260907))))

(declare-fun b!167585 () Bool)

(declare-fun lt!260909 () (_ BitVec 64))

(assert (=> b!167585 (= e!116284 (bvsle lt!260907 (bvmul lt!260909 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167585 (or (= lt!260909 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!260909 #b0000000000000000000000000000000000000000000000000000000000001000) lt!260909)))))

(assert (=> b!167585 (= lt!260909 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))))))

(assert (= (and d!58709 res!139537) b!167584))

(assert (= (and b!167584 res!139536) b!167585))

(assert (=> d!58709 m!266779))

(declare-fun m!266797 () Bool)

(assert (=> d!58709 m!266797))

(assert (=> b!167511 d!58709))

(declare-fun d!58713 () Bool)

(assert (=> d!58713 (= (byteRangesEq!0 (select (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577)) lt!260795 #b00000000000000000000000000000000 lt!260800) (or (= #b00000000000000000000000000000000 lt!260800) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260800))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) lt!260795) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!260800))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14575 () Bool)

(assert (= bs!14575 d!58713))

(declare-fun m!266799 () Bool)

(assert (=> bs!14575 m!266799))

(declare-fun m!266801 () Bool)

(assert (=> bs!14575 m!266801))

(assert (=> b!167514 d!58713))

(declare-fun d!58715 () Bool)

(declare-fun res!139542 () Bool)

(declare-fun e!116289 () Bool)

(assert (=> d!58715 (=> res!139542 e!116289)))

(assert (=> d!58715 (= res!139542 (= #b00000000000000000000000000000000 (currentByte!8153 thiss!1577)))))

(assert (=> d!58715 (= (arrayRangesEq!685 (buf!4308 thiss!1577) lt!260787 #b00000000000000000000000000000000 (currentByte!8153 thiss!1577)) e!116289)))

(declare-fun b!167590 () Bool)

(declare-fun e!116290 () Bool)

(assert (=> b!167590 (= e!116289 e!116290)))

(declare-fun res!139543 () Bool)

(assert (=> b!167590 (=> (not res!139543) (not e!116290))))

(assert (=> b!167590 (= res!139543 (= (select (arr!4777 (buf!4308 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4777 lt!260787) #b00000000000000000000000000000000)))))

(declare-fun b!167591 () Bool)

(assert (=> b!167591 (= e!116290 (arrayRangesEq!685 (buf!4308 thiss!1577) lt!260787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)))))

(assert (= (and d!58715 (not res!139542)) b!167590))

(assert (= (and b!167590 res!139543) b!167591))

(declare-fun m!266807 () Bool)

(assert (=> b!167590 m!266807))

(declare-fun m!266809 () Bool)

(assert (=> b!167590 m!266809))

(declare-fun m!266811 () Bool)

(assert (=> b!167591 m!266811))

(assert (=> b!167514 d!58715))

(declare-fun d!58719 () Bool)

(declare-fun e!116298 () Bool)

(assert (=> d!58719 e!116298))

(declare-fun res!139551 () Bool)

(assert (=> d!58719 (=> (not res!139551) (not e!116298))))

(assert (=> d!58719 (= res!139551 (and (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) (size!3856 lt!260790))))))

(declare-fun lt!260918 () Unit!11660)

(declare-fun choose!255 (array!8684 (_ BitVec 32) (_ BitVec 8)) Unit!11660)

(assert (=> d!58719 (= lt!260918 (choose!255 lt!260790 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788))))

(assert (=> d!58719 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) (size!3856 lt!260790)))))

(assert (=> d!58719 (= (arrayUpdatedAtPrefixLemma!293 lt!260790 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) lt!260918)))

(declare-fun b!167599 () Bool)

(assert (=> b!167599 (= e!116298 (arrayRangesEq!685 lt!260790 (array!8685 (store (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) (size!3856 lt!260790)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (= (and d!58719 res!139551) b!167599))

(declare-fun m!266825 () Bool)

(assert (=> d!58719 m!266825))

(declare-fun m!266827 () Bool)

(assert (=> b!167599 m!266827))

(declare-fun m!266829 () Bool)

(assert (=> b!167599 m!266829))

(assert (=> b!167514 d!58719))

(declare-fun d!58729 () Bool)

(assert (=> d!58729 (arrayRangesEq!685 (buf!4308 thiss!1577) lt!260787 #b00000000000000000000000000000000 (currentByte!8153 thiss!1577))))

(declare-fun lt!260923 () Unit!11660)

(declare-fun choose!256 (array!8684 array!8684 array!8684 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11660)

(assert (=> d!58729 (= lt!260923 (choose!256 (buf!4308 thiss!1577) lt!260790 lt!260787 #b00000000000000000000000000000000 (currentByte!8153 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (=> d!58729 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!8153 thiss!1577)) (bvsle (currentByte!8153 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (=> d!58729 (= (arrayRangesEqTransitive!187 (buf!4308 thiss!1577) lt!260790 lt!260787 #b00000000000000000000000000000000 (currentByte!8153 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) lt!260923)))

(declare-fun bs!14578 () Bool)

(assert (= bs!14578 d!58729))

(assert (=> bs!14578 m!266657))

(declare-fun m!266831 () Bool)

(assert (=> bs!14578 m!266831))

(assert (=> b!167514 d!58729))

(declare-fun d!58731 () Bool)

(declare-fun e!116299 () Bool)

(assert (=> d!58731 e!116299))

(declare-fun res!139552 () Bool)

(assert (=> d!58731 (=> (not res!139552) (not e!116299))))

(assert (=> d!58731 (= res!139552 (and (bvsge (currentByte!8153 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentByte!8153 thiss!1577) (size!3856 (buf!4308 thiss!1577)))))))

(declare-fun lt!260925 () Unit!11660)

(assert (=> d!58731 (= lt!260925 (choose!255 (buf!4308 thiss!1577) (currentByte!8153 thiss!1577) lt!260795))))

(assert (=> d!58731 (and (bvsle #b00000000000000000000000000000000 (currentByte!8153 thiss!1577)) (bvslt (currentByte!8153 thiss!1577) (size!3856 (buf!4308 thiss!1577))))))

(assert (=> d!58731 (= (arrayUpdatedAtPrefixLemma!293 (buf!4308 thiss!1577) (currentByte!8153 thiss!1577) lt!260795) lt!260925)))

(declare-fun b!167600 () Bool)

(assert (=> b!167600 (= e!116299 (arrayRangesEq!685 (buf!4308 thiss!1577) (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8153 thiss!1577)))))

(assert (= (and d!58731 res!139552) b!167600))

(declare-fun m!266835 () Bool)

(assert (=> d!58731 m!266835))

(assert (=> b!167600 m!266659))

(assert (=> b!167600 m!266655))

(assert (=> b!167514 d!58731))

(declare-fun d!58735 () Bool)

(declare-fun res!139553 () Bool)

(declare-fun e!116300 () Bool)

(assert (=> d!58735 (=> res!139553 e!116300)))

(assert (=> d!58735 (= res!139553 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (=> d!58735 (= (arrayRangesEq!685 lt!260790 lt!260787 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) e!116300)))

(declare-fun b!167601 () Bool)

(declare-fun e!116301 () Bool)

(assert (=> b!167601 (= e!116300 e!116301)))

(declare-fun res!139554 () Bool)

(assert (=> b!167601 (=> (not res!139554) (not e!116301))))

(assert (=> b!167601 (= res!139554 (= (select (arr!4777 lt!260790) #b00000000000000000000000000000000) (select (arr!4777 lt!260787) #b00000000000000000000000000000000)))))

(declare-fun b!167602 () Bool)

(assert (=> b!167602 (= e!116301 (arrayRangesEq!685 lt!260790 lt!260787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (= (and d!58735 (not res!139553)) b!167601))

(assert (= (and b!167601 res!139554) b!167602))

(declare-fun m!266837 () Bool)

(assert (=> b!167601 m!266837))

(assert (=> b!167601 m!266809))

(declare-fun m!266839 () Bool)

(assert (=> b!167602 m!266839))

(assert (=> b!167514 d!58735))

(declare-fun d!58737 () Bool)

(declare-fun res!139555 () Bool)

(declare-fun e!116302 () Bool)

(assert (=> d!58737 (=> res!139555 e!116302)))

(assert (=> d!58737 (= res!139555 (= #b00000000000000000000000000000000 (currentByte!8153 thiss!1577)))))

(assert (=> d!58737 (= (arrayRangesEq!685 (buf!4308 thiss!1577) (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8153 thiss!1577)) e!116302)))

(declare-fun b!167603 () Bool)

(declare-fun e!116303 () Bool)

(assert (=> b!167603 (= e!116302 e!116303)))

(declare-fun res!139556 () Bool)

(assert (=> b!167603 (=> (not res!139556) (not e!116303))))

(assert (=> b!167603 (= res!139556 (= (select (arr!4777 (buf!4308 thiss!1577)) #b00000000000000000000000000000000) (select (arr!4777 (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577)))) #b00000000000000000000000000000000)))))

(declare-fun b!167604 () Bool)

(assert (=> b!167604 (= e!116303 (arrayRangesEq!685 (buf!4308 thiss!1577) (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)))))

(assert (= (and d!58737 (not res!139555)) b!167603))

(assert (= (and b!167603 res!139556) b!167604))

(assert (=> b!167603 m!266807))

(declare-fun m!266841 () Bool)

(assert (=> b!167603 m!266841))

(declare-fun m!266843 () Bool)

(assert (=> b!167604 m!266843))

(assert (=> b!167514 d!58737))

(declare-fun d!58739 () Bool)

(assert (=> d!58739 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8148 thiss!1577) (currentByte!8153 thiss!1577) (size!3856 (buf!4308 thiss!1577))))))

(declare-fun bs!14580 () Bool)

(assert (= bs!14580 d!58739))

(assert (=> bs!14580 m!266797))

(assert (=> start!36414 d!58739))

(declare-fun d!58741 () Bool)

(declare-datatypes ((tuple2!14624 0))(
  ( (tuple2!14625 (_1!7909 (_ BitVec 8)) (_2!7909 BitStream!6868)) )
))
(declare-fun lt!260928 () tuple2!14624)

(declare-fun readPartialByte!0 (BitStream!6868 (_ BitVec 32)) tuple2!14624)

(assert (=> d!58741 (= lt!260928 (readPartialByte!0 (_1!7903 lt!260794) nBits!511))))

(assert (=> d!58741 (= (readPartialBytePure!0 (_1!7903 lt!260794) nBits!511) (tuple2!14615 (_2!7909 lt!260928) (_1!7909 lt!260928)))))

(declare-fun bs!14581 () Bool)

(assert (= bs!14581 d!58741))

(declare-fun m!266845 () Bool)

(assert (=> bs!14581 m!266845))

(assert (=> b!167515 d!58741))

(declare-fun b!167654 () Bool)

(declare-fun lt!261047 () (_ BitVec 64))

(declare-fun e!116335 () Bool)

(declare-fun lt!261052 () (_ BitVec 64))

(declare-fun lt!261034 () tuple2!14612)

(declare-fun withMovedBitIndex!0 (BitStream!6868 (_ BitVec 64)) BitStream!6868)

(assert (=> b!167654 (= e!116335 (= (_1!7903 lt!261034) (withMovedBitIndex!0 (_2!7903 lt!261034) (bvsub lt!261052 lt!261047))))))

(assert (=> b!167654 (or (= (bvand lt!261052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261047 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261052 lt!261047) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!167654 (= lt!261047 (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797)))))

(assert (=> b!167654 (= lt!261052 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)))))

(declare-fun b!167655 () Bool)

(declare-fun e!116336 () Unit!11660)

(declare-fun Unit!11666 () Unit!11660)

(assert (=> b!167655 (= e!116336 Unit!11666)))

(declare-fun b!167656 () Bool)

(declare-fun res!139598 () Bool)

(assert (=> b!167656 (=> (not res!139598) (not e!116335))))

(assert (=> b!167656 (= res!139598 (isPrefixOf!0 (_1!7903 lt!261034) thiss!1577))))

(declare-fun d!58745 () Bool)

(assert (=> d!58745 e!116335))

(declare-fun res!139600 () Bool)

(assert (=> d!58745 (=> (not res!139600) (not e!116335))))

(assert (=> d!58745 (= res!139600 (isPrefixOf!0 (_1!7903 lt!261034) (_2!7903 lt!261034)))))

(declare-fun lt!261045 () BitStream!6868)

(assert (=> d!58745 (= lt!261034 (tuple2!14613 lt!261045 lt!260797))))

(declare-fun lt!261046 () Unit!11660)

(declare-fun lt!261041 () Unit!11660)

(assert (=> d!58745 (= lt!261046 lt!261041)))

(assert (=> d!58745 (isPrefixOf!0 lt!261045 lt!260797)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!6868 BitStream!6868 BitStream!6868) Unit!11660)

(assert (=> d!58745 (= lt!261041 (lemmaIsPrefixTransitive!0 lt!261045 lt!260797 lt!260797))))

(declare-fun lt!261039 () Unit!11660)

(declare-fun lt!261043 () Unit!11660)

(assert (=> d!58745 (= lt!261039 lt!261043)))

(assert (=> d!58745 (isPrefixOf!0 lt!261045 lt!260797)))

(assert (=> d!58745 (= lt!261043 (lemmaIsPrefixTransitive!0 lt!261045 thiss!1577 lt!260797))))

(declare-fun lt!261038 () Unit!11660)

(assert (=> d!58745 (= lt!261038 e!116336)))

(declare-fun c!8641 () Bool)

(assert (=> d!58745 (= c!8641 (not (= (size!3856 (buf!4308 thiss!1577)) #b00000000000000000000000000000000)))))

(declare-fun lt!261050 () Unit!11660)

(declare-fun lt!261035 () Unit!11660)

(assert (=> d!58745 (= lt!261050 lt!261035)))

(assert (=> d!58745 (isPrefixOf!0 lt!260797 lt!260797)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!6868) Unit!11660)

(assert (=> d!58745 (= lt!261035 (lemmaIsPrefixRefl!0 lt!260797))))

(declare-fun lt!261042 () Unit!11660)

(declare-fun lt!261036 () Unit!11660)

(assert (=> d!58745 (= lt!261042 lt!261036)))

(assert (=> d!58745 (= lt!261036 (lemmaIsPrefixRefl!0 lt!260797))))

(declare-fun lt!261053 () Unit!11660)

(declare-fun lt!261044 () Unit!11660)

(assert (=> d!58745 (= lt!261053 lt!261044)))

(assert (=> d!58745 (isPrefixOf!0 lt!261045 lt!261045)))

(assert (=> d!58745 (= lt!261044 (lemmaIsPrefixRefl!0 lt!261045))))

(declare-fun lt!261048 () Unit!11660)

(declare-fun lt!261051 () Unit!11660)

(assert (=> d!58745 (= lt!261048 lt!261051)))

(assert (=> d!58745 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!58745 (= lt!261051 (lemmaIsPrefixRefl!0 thiss!1577))))

(assert (=> d!58745 (= lt!261045 (BitStream!6869 (buf!4308 lt!260797) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)))))

(assert (=> d!58745 (isPrefixOf!0 thiss!1577 lt!260797)))

(assert (=> d!58745 (= (reader!0 thiss!1577 lt!260797) lt!261034)))

(declare-fun b!167657 () Bool)

(declare-fun lt!261049 () Unit!11660)

(assert (=> b!167657 (= e!116336 lt!261049)))

(declare-fun lt!261040 () (_ BitVec 64))

(assert (=> b!167657 (= lt!261040 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!261037 () (_ BitVec 64))

(assert (=> b!167657 (= lt!261037 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!8684 array!8684 (_ BitVec 64) (_ BitVec 64)) Unit!11660)

(assert (=> b!167657 (= lt!261049 (arrayBitRangesEqSymmetric!0 (buf!4308 thiss!1577) (buf!4308 lt!260797) lt!261040 lt!261037))))

(assert (=> b!167657 (arrayBitRangesEq!0 (buf!4308 lt!260797) (buf!4308 thiss!1577) lt!261040 lt!261037)))

(declare-fun b!167658 () Bool)

(declare-fun res!139599 () Bool)

(assert (=> b!167658 (=> (not res!139599) (not e!116335))))

(assert (=> b!167658 (= res!139599 (isPrefixOf!0 (_2!7903 lt!261034) lt!260797))))

(assert (= (and d!58745 c!8641) b!167657))

(assert (= (and d!58745 (not c!8641)) b!167655))

(assert (= (and d!58745 res!139600) b!167656))

(assert (= (and b!167656 res!139598) b!167658))

(assert (= (and b!167658 res!139599) b!167654))

(declare-fun m!266887 () Bool)

(assert (=> b!167658 m!266887))

(assert (=> b!167657 m!266673))

(declare-fun m!266889 () Bool)

(assert (=> b!167657 m!266889))

(declare-fun m!266891 () Bool)

(assert (=> b!167657 m!266891))

(declare-fun m!266893 () Bool)

(assert (=> b!167654 m!266893))

(assert (=> b!167654 m!266775))

(assert (=> b!167654 m!266673))

(declare-fun m!266895 () Bool)

(assert (=> d!58745 m!266895))

(declare-fun m!266897 () Bool)

(assert (=> d!58745 m!266897))

(declare-fun m!266899 () Bool)

(assert (=> d!58745 m!266899))

(assert (=> d!58745 m!266669))

(declare-fun m!266901 () Bool)

(assert (=> d!58745 m!266901))

(declare-fun m!266903 () Bool)

(assert (=> d!58745 m!266903))

(declare-fun m!266905 () Bool)

(assert (=> d!58745 m!266905))

(declare-fun m!266907 () Bool)

(assert (=> d!58745 m!266907))

(declare-fun m!266909 () Bool)

(assert (=> d!58745 m!266909))

(declare-fun m!266911 () Bool)

(assert (=> d!58745 m!266911))

(declare-fun m!266913 () Bool)

(assert (=> d!58745 m!266913))

(declare-fun m!266915 () Bool)

(assert (=> b!167656 m!266915))

(assert (=> b!167515 d!58745))

(declare-fun d!58771 () Bool)

(assert (=> d!58771 (= (array_inv!3597 (buf!4308 thiss!1577)) (bvsge (size!3856 (buf!4308 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!167513 d!58771))

(push 1)

(assert (not d!58701))

(assert (not d!58731))

(assert (not d!58745))

(assert (not d!58703))

(assert (not d!58741))

(assert (not b!167654))

(assert (not b!167591))

(assert (not b!167599))

(assert (not b!167658))

(assert (not b!167656))

(assert (not d!58719))

(assert (not d!58739))

(assert (not b!167657))

(assert (not d!58709))

(assert (not b!167604))

(assert (not d!58729))

(assert (not b!167600))

(assert (not b!167602))

(assert (not b!167568))

(assert (not b!167566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58923 () Bool)

(declare-fun res!139762 () Bool)

(declare-fun e!116485 () Bool)

(assert (=> d!58923 (=> res!139762 e!116485)))

(assert (=> d!58923 (= res!139762 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)))))

(assert (=> d!58923 (= (arrayRangesEq!685 (buf!4308 thiss!1577) lt!260787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)) e!116485)))

(declare-fun b!167857 () Bool)

(declare-fun e!116486 () Bool)

(assert (=> b!167857 (= e!116485 e!116486)))

(declare-fun res!139763 () Bool)

(assert (=> b!167857 (=> (not res!139763) (not e!116486))))

(assert (=> b!167857 (= res!139763 (= (select (arr!4777 (buf!4308 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4777 lt!260787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167858 () Bool)

(assert (=> b!167858 (= e!116486 (arrayRangesEq!685 (buf!4308 thiss!1577) lt!260787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)))))

(assert (= (and d!58923 (not res!139762)) b!167857))

(assert (= (and b!167857 res!139763) b!167858))

(declare-fun m!267263 () Bool)

(assert (=> b!167857 m!267263))

(declare-fun m!267265 () Bool)

(assert (=> b!167857 m!267265))

(declare-fun m!267267 () Bool)

(assert (=> b!167858 m!267267))

(assert (=> b!167591 d!58923))

(declare-fun d!58925 () Bool)

(declare-fun res!139764 () Bool)

(declare-fun e!116488 () Bool)

(assert (=> d!58925 (=> (not res!139764) (not e!116488))))

(assert (=> d!58925 (= res!139764 (= (size!3856 (buf!4308 (_2!7903 lt!261034))) (size!3856 (buf!4308 lt!260797))))))

(assert (=> d!58925 (= (isPrefixOf!0 (_2!7903 lt!261034) lt!260797) e!116488)))

(declare-fun b!167859 () Bool)

(declare-fun res!139766 () Bool)

(assert (=> b!167859 (=> (not res!139766) (not e!116488))))

(assert (=> b!167859 (= res!139766 (bvsle (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034))) (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797))))))

(declare-fun b!167860 () Bool)

(declare-fun e!116487 () Bool)

(assert (=> b!167860 (= e!116488 e!116487)))

(declare-fun res!139765 () Bool)

(assert (=> b!167860 (=> res!139765 e!116487)))

(assert (=> b!167860 (= res!139765 (= (size!3856 (buf!4308 (_2!7903 lt!261034))) #b00000000000000000000000000000000))))

(declare-fun b!167861 () Bool)

(assert (=> b!167861 (= e!116487 (arrayBitRangesEq!0 (buf!4308 (_2!7903 lt!261034)) (buf!4308 lt!260797) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034)))))))

(assert (= (and d!58925 res!139764) b!167859))

(assert (= (and b!167859 res!139766) b!167860))

(assert (= (and b!167860 (not res!139765)) b!167861))

(declare-fun m!267269 () Bool)

(assert (=> b!167859 m!267269))

(assert (=> b!167859 m!266775))

(assert (=> b!167861 m!267269))

(assert (=> b!167861 m!267269))

(declare-fun m!267271 () Bool)

(assert (=> b!167861 m!267271))

(assert (=> b!167658 d!58925))

(declare-fun d!58927 () Bool)

(declare-fun res!139767 () Bool)

(declare-fun e!116489 () Bool)

(assert (=> d!58927 (=> res!139767 e!116489)))

(assert (=> d!58927 (= res!139767 (= #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (=> d!58927 (= (arrayRangesEq!685 lt!260790 (array!8685 (store (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) (size!3856 lt!260790)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) e!116489)))

(declare-fun b!167862 () Bool)

(declare-fun e!116490 () Bool)

(assert (=> b!167862 (= e!116489 e!116490)))

(declare-fun res!139768 () Bool)

(assert (=> b!167862 (=> (not res!139768) (not e!116490))))

(assert (=> b!167862 (= res!139768 (= (select (arr!4777 lt!260790) #b00000000000000000000000000000000) (select (arr!4777 (array!8685 (store (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) (size!3856 lt!260790))) #b00000000000000000000000000000000)))))

(declare-fun b!167863 () Bool)

(assert (=> b!167863 (= e!116490 (arrayRangesEq!685 lt!260790 (array!8685 (store (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) (size!3856 lt!260790)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (= (and d!58927 (not res!139767)) b!167862))

(assert (= (and b!167862 res!139768) b!167863))

(assert (=> b!167862 m!266837))

(declare-fun m!267273 () Bool)

(assert (=> b!167862 m!267273))

(declare-fun m!267275 () Bool)

(assert (=> b!167863 m!267275))

(assert (=> b!167599 d!58927))

(declare-fun d!58929 () Bool)

(declare-fun res!139769 () Bool)

(declare-fun e!116492 () Bool)

(assert (=> d!58929 (=> (not res!139769) (not e!116492))))

(assert (=> d!58929 (= res!139769 (= (size!3856 (buf!4308 lt!260797)) (size!3856 (buf!4308 lt!260797))))))

(assert (=> d!58929 (= (isPrefixOf!0 lt!260797 lt!260797) e!116492)))

(declare-fun b!167864 () Bool)

(declare-fun res!139771 () Bool)

(assert (=> b!167864 (=> (not res!139771) (not e!116492))))

(assert (=> b!167864 (= res!139771 (bvsle (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797)) (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797))))))

(declare-fun b!167865 () Bool)

(declare-fun e!116491 () Bool)

(assert (=> b!167865 (= e!116492 e!116491)))

(declare-fun res!139770 () Bool)

(assert (=> b!167865 (=> res!139770 e!116491)))

(assert (=> b!167865 (= res!139770 (= (size!3856 (buf!4308 lt!260797)) #b00000000000000000000000000000000))))

(declare-fun b!167866 () Bool)

(assert (=> b!167866 (= e!116491 (arrayBitRangesEq!0 (buf!4308 lt!260797) (buf!4308 lt!260797) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797))))))

(assert (= (and d!58929 res!139769) b!167864))

(assert (= (and b!167864 res!139771) b!167865))

(assert (= (and b!167865 (not res!139770)) b!167866))

(assert (=> b!167864 m!266775))

(assert (=> b!167864 m!266775))

(assert (=> b!167866 m!266775))

(assert (=> b!167866 m!266775))

(declare-fun m!267277 () Bool)

(assert (=> b!167866 m!267277))

(assert (=> d!58745 d!58929))

(declare-fun d!58931 () Bool)

(declare-fun res!139772 () Bool)

(declare-fun e!116494 () Bool)

(assert (=> d!58931 (=> (not res!139772) (not e!116494))))

(assert (=> d!58931 (= res!139772 (= (size!3856 (buf!4308 (_1!7903 lt!261034))) (size!3856 (buf!4308 (_2!7903 lt!261034)))))))

(assert (=> d!58931 (= (isPrefixOf!0 (_1!7903 lt!261034) (_2!7903 lt!261034)) e!116494)))

(declare-fun b!167867 () Bool)

(declare-fun res!139774 () Bool)

(assert (=> b!167867 (=> (not res!139774) (not e!116494))))

(assert (=> b!167867 (= res!139774 (bvsle (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034))) (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034)))))))

(declare-fun b!167868 () Bool)

(declare-fun e!116493 () Bool)

(assert (=> b!167868 (= e!116494 e!116493)))

(declare-fun res!139773 () Bool)

(assert (=> b!167868 (=> res!139773 e!116493)))

(assert (=> b!167868 (= res!139773 (= (size!3856 (buf!4308 (_1!7903 lt!261034))) #b00000000000000000000000000000000))))

(declare-fun b!167869 () Bool)

(assert (=> b!167869 (= e!116493 (arrayBitRangesEq!0 (buf!4308 (_1!7903 lt!261034)) (buf!4308 (_2!7903 lt!261034)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034)))))))

(assert (= (and d!58931 res!139772) b!167867))

(assert (= (and b!167867 res!139774) b!167868))

(assert (= (and b!167868 (not res!139773)) b!167869))

(declare-fun m!267279 () Bool)

(assert (=> b!167867 m!267279))

(assert (=> b!167867 m!267269))

(assert (=> b!167869 m!267279))

(assert (=> b!167869 m!267279))

(declare-fun m!267281 () Bool)

(assert (=> b!167869 m!267281))

(assert (=> d!58745 d!58931))

(declare-fun d!58933 () Bool)

(assert (=> d!58933 (isPrefixOf!0 lt!260797 lt!260797)))

(declare-fun lt!261310 () Unit!11660)

(declare-fun choose!11 (BitStream!6868) Unit!11660)

(assert (=> d!58933 (= lt!261310 (choose!11 lt!260797))))

(assert (=> d!58933 (= (lemmaIsPrefixRefl!0 lt!260797) lt!261310)))

(declare-fun bs!14611 () Bool)

(assert (= bs!14611 d!58933))

(assert (=> bs!14611 m!266911))

(declare-fun m!267283 () Bool)

(assert (=> bs!14611 m!267283))

(assert (=> d!58745 d!58933))

(declare-fun d!58935 () Bool)

(assert (=> d!58935 (isPrefixOf!0 thiss!1577 thiss!1577)))

(declare-fun lt!261311 () Unit!11660)

(assert (=> d!58935 (= lt!261311 (choose!11 thiss!1577))))

(assert (=> d!58935 (= (lemmaIsPrefixRefl!0 thiss!1577) lt!261311)))

(declare-fun bs!14612 () Bool)

(assert (= bs!14612 d!58935))

(assert (=> bs!14612 m!266909))

(declare-fun m!267285 () Bool)

(assert (=> bs!14612 m!267285))

(assert (=> d!58745 d!58935))

(declare-fun d!58937 () Bool)

(assert (=> d!58937 (isPrefixOf!0 lt!261045 lt!261045)))

(declare-fun lt!261312 () Unit!11660)

(assert (=> d!58937 (= lt!261312 (choose!11 lt!261045))))

(assert (=> d!58937 (= (lemmaIsPrefixRefl!0 lt!261045) lt!261312)))

(declare-fun bs!14613 () Bool)

(assert (= bs!14613 d!58937))

(assert (=> bs!14613 m!266899))

(declare-fun m!267287 () Bool)

(assert (=> bs!14613 m!267287))

(assert (=> d!58745 d!58937))

(declare-fun d!58939 () Bool)

(assert (=> d!58939 (isPrefixOf!0 lt!261045 lt!260797)))

(declare-fun lt!261315 () Unit!11660)

(declare-fun choose!30 (BitStream!6868 BitStream!6868 BitStream!6868) Unit!11660)

(assert (=> d!58939 (= lt!261315 (choose!30 lt!261045 lt!260797 lt!260797))))

(assert (=> d!58939 (isPrefixOf!0 lt!261045 lt!260797)))

(assert (=> d!58939 (= (lemmaIsPrefixTransitive!0 lt!261045 lt!260797 lt!260797) lt!261315)))

(declare-fun bs!14614 () Bool)

(assert (= bs!14614 d!58939))

(assert (=> bs!14614 m!266895))

(declare-fun m!267289 () Bool)

(assert (=> bs!14614 m!267289))

(assert (=> bs!14614 m!266895))

(assert (=> d!58745 d!58939))

(declare-fun d!58941 () Bool)

(assert (=> d!58941 (isPrefixOf!0 lt!261045 lt!260797)))

(declare-fun lt!261316 () Unit!11660)

(assert (=> d!58941 (= lt!261316 (choose!30 lt!261045 thiss!1577 lt!260797))))

(assert (=> d!58941 (isPrefixOf!0 lt!261045 thiss!1577)))

(assert (=> d!58941 (= (lemmaIsPrefixTransitive!0 lt!261045 thiss!1577 lt!260797) lt!261316)))

(declare-fun bs!14615 () Bool)

(assert (= bs!14615 d!58941))

(assert (=> bs!14615 m!266895))

(declare-fun m!267291 () Bool)

(assert (=> bs!14615 m!267291))

(declare-fun m!267293 () Bool)

(assert (=> bs!14615 m!267293))

(assert (=> d!58745 d!58941))

(declare-fun d!58943 () Bool)

(declare-fun res!139775 () Bool)

(declare-fun e!116496 () Bool)

(assert (=> d!58943 (=> (not res!139775) (not e!116496))))

(assert (=> d!58943 (= res!139775 (= (size!3856 (buf!4308 thiss!1577)) (size!3856 (buf!4308 thiss!1577))))))

(assert (=> d!58943 (= (isPrefixOf!0 thiss!1577 thiss!1577) e!116496)))

(declare-fun b!167870 () Bool)

(declare-fun res!139777 () Bool)

(assert (=> b!167870 (=> (not res!139777) (not e!116496))))

(assert (=> b!167870 (= res!139777 (bvsle (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)) (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))))))

(declare-fun b!167871 () Bool)

(declare-fun e!116495 () Bool)

(assert (=> b!167871 (= e!116496 e!116495)))

(declare-fun res!139776 () Bool)

(assert (=> b!167871 (=> res!139776 e!116495)))

(assert (=> b!167871 (= res!139776 (= (size!3856 (buf!4308 thiss!1577)) #b00000000000000000000000000000000))))

(declare-fun b!167872 () Bool)

(assert (=> b!167872 (= e!116495 (arrayBitRangesEq!0 (buf!4308 thiss!1577) (buf!4308 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))))))

(assert (= (and d!58943 res!139775) b!167870))

(assert (= (and b!167870 res!139777) b!167871))

(assert (= (and b!167871 (not res!139776)) b!167872))

(assert (=> b!167870 m!266673))

(assert (=> b!167870 m!266673))

(assert (=> b!167872 m!266673))

(assert (=> b!167872 m!266673))

(declare-fun m!267295 () Bool)

(assert (=> b!167872 m!267295))

(assert (=> d!58745 d!58943))

(declare-fun d!58945 () Bool)

(declare-fun res!139778 () Bool)

(declare-fun e!116498 () Bool)

(assert (=> d!58945 (=> (not res!139778) (not e!116498))))

(assert (=> d!58945 (= res!139778 (= (size!3856 (buf!4308 lt!261045)) (size!3856 (buf!4308 lt!261045))))))

(assert (=> d!58945 (= (isPrefixOf!0 lt!261045 lt!261045) e!116498)))

(declare-fun b!167873 () Bool)

(declare-fun res!139780 () Bool)

(assert (=> b!167873 (=> (not res!139780) (not e!116498))))

(assert (=> b!167873 (= res!139780 (bvsle (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045)) (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045))))))

(declare-fun b!167874 () Bool)

(declare-fun e!116497 () Bool)

(assert (=> b!167874 (= e!116498 e!116497)))

(declare-fun res!139779 () Bool)

(assert (=> b!167874 (=> res!139779 e!116497)))

(assert (=> b!167874 (= res!139779 (= (size!3856 (buf!4308 lt!261045)) #b00000000000000000000000000000000))))

(declare-fun b!167875 () Bool)

(assert (=> b!167875 (= e!116497 (arrayBitRangesEq!0 (buf!4308 lt!261045) (buf!4308 lt!261045) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045))))))

(assert (= (and d!58945 res!139778) b!167873))

(assert (= (and b!167873 res!139780) b!167874))

(assert (= (and b!167874 (not res!139779)) b!167875))

(declare-fun m!267297 () Bool)

(assert (=> b!167873 m!267297))

(assert (=> b!167873 m!267297))

(assert (=> b!167875 m!267297))

(assert (=> b!167875 m!267297))

(declare-fun m!267299 () Bool)

(assert (=> b!167875 m!267299))

(assert (=> d!58745 d!58945))

(declare-fun d!58947 () Bool)

(declare-fun res!139781 () Bool)

(declare-fun e!116500 () Bool)

(assert (=> d!58947 (=> (not res!139781) (not e!116500))))

(assert (=> d!58947 (= res!139781 (= (size!3856 (buf!4308 lt!261045)) (size!3856 (buf!4308 lt!260797))))))

(assert (=> d!58947 (= (isPrefixOf!0 lt!261045 lt!260797) e!116500)))

(declare-fun b!167876 () Bool)

(declare-fun res!139783 () Bool)

(assert (=> b!167876 (=> (not res!139783) (not e!116500))))

(assert (=> b!167876 (= res!139783 (bvsle (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045)) (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797))))))

(declare-fun b!167877 () Bool)

(declare-fun e!116499 () Bool)

(assert (=> b!167877 (= e!116500 e!116499)))

(declare-fun res!139782 () Bool)

(assert (=> b!167877 (=> res!139782 e!116499)))

(assert (=> b!167877 (= res!139782 (= (size!3856 (buf!4308 lt!261045)) #b00000000000000000000000000000000))))

(declare-fun b!167878 () Bool)

(assert (=> b!167878 (= e!116499 (arrayBitRangesEq!0 (buf!4308 lt!261045) (buf!4308 lt!260797) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045))))))

(assert (= (and d!58947 res!139781) b!167876))

(assert (= (and b!167876 res!139783) b!167877))

(assert (= (and b!167877 (not res!139782)) b!167878))

(assert (=> b!167876 m!267297))

(assert (=> b!167876 m!266775))

(assert (=> b!167878 m!267297))

(assert (=> b!167878 m!267297))

(declare-fun m!267301 () Bool)

(assert (=> b!167878 m!267301))

(assert (=> d!58745 d!58947))

(assert (=> d!58745 d!58699))

(declare-fun d!58949 () Bool)

(assert (=> d!58949 (= (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))) ((_ sign_extend 32) (currentByte!8153 thiss!1577)) ((_ sign_extend 32) (currentBit!8148 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8153 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8148 thiss!1577)))))))

(assert (=> d!58701 d!58949))

(declare-fun d!58951 () Bool)

(assert (=> d!58951 (= (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) ((_ sign_extend 32) lt!260800)) (bvsub (bvmul ((_ sign_extend 32) (size!3856 (buf!4308 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) lt!260800))))))

(assert (=> d!58703 d!58951))

(declare-fun d!58953 () Bool)

(assert (=> d!58953 (= (invariant!0 lt!260800 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) (size!3856 (buf!4308 thiss!1577))) (and (bvsge lt!260800 #b00000000000000000000000000000000) (bvslt lt!260800 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) (size!3856 (buf!4308 thiss!1577))) (and (= lt!260800 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) (size!3856 (buf!4308 thiss!1577)))))))))

(assert (=> d!58703 d!58953))

(assert (=> d!58709 d!58949))

(declare-fun d!58955 () Bool)

(assert (=> d!58955 (= (invariant!0 (currentBit!8148 thiss!1577) (currentByte!8153 thiss!1577) (size!3856 (buf!4308 thiss!1577))) (and (bvsge (currentBit!8148 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!8148 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!8153 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!8153 thiss!1577) (size!3856 (buf!4308 thiss!1577))) (and (= (currentBit!8148 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!8153 thiss!1577) (size!3856 (buf!4308 thiss!1577)))))))))

(assert (=> d!58709 d!58955))

(assert (=> d!58739 d!58955))

(assert (=> b!167600 d!58737))

(assert (=> b!167566 d!58709))

(declare-fun d!58957 () Bool)

(declare-fun e!116501 () Bool)

(assert (=> d!58957 e!116501))

(declare-fun res!139785 () Bool)

(assert (=> d!58957 (=> (not res!139785) (not e!116501))))

(declare-fun lt!261321 () (_ BitVec 64))

(declare-fun lt!261318 () (_ BitVec 64))

(declare-fun lt!261322 () (_ BitVec 64))

(assert (=> d!58957 (= res!139785 (= lt!261318 (bvsub lt!261322 lt!261321)))))

(assert (=> d!58957 (or (= (bvand lt!261322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261321 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261322 lt!261321) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58957 (= lt!261321 (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 lt!260797))) ((_ sign_extend 32) (currentByte!8153 lt!260797)) ((_ sign_extend 32) (currentBit!8148 lt!260797))))))

(declare-fun lt!261319 () (_ BitVec 64))

(declare-fun lt!261317 () (_ BitVec 64))

(assert (=> d!58957 (= lt!261322 (bvmul lt!261319 lt!261317))))

(assert (=> d!58957 (or (= lt!261319 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261317 (bvsdiv (bvmul lt!261319 lt!261317) lt!261319)))))

(assert (=> d!58957 (= lt!261317 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!58957 (= lt!261319 ((_ sign_extend 32) (size!3856 (buf!4308 lt!260797))))))

(assert (=> d!58957 (= lt!261318 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8153 lt!260797)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8148 lt!260797))))))

(assert (=> d!58957 (invariant!0 (currentBit!8148 lt!260797) (currentByte!8153 lt!260797) (size!3856 (buf!4308 lt!260797)))))

(assert (=> d!58957 (= (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797)) lt!261318)))

(declare-fun b!167879 () Bool)

(declare-fun res!139784 () Bool)

(assert (=> b!167879 (=> (not res!139784) (not e!116501))))

(assert (=> b!167879 (= res!139784 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261318))))

(declare-fun b!167880 () Bool)

(declare-fun lt!261320 () (_ BitVec 64))

(assert (=> b!167880 (= e!116501 (bvsle lt!261318 (bvmul lt!261320 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167880 (or (= lt!261320 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261320 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261320)))))

(assert (=> b!167880 (= lt!261320 ((_ sign_extend 32) (size!3856 (buf!4308 lt!260797))))))

(assert (= (and d!58957 res!139785) b!167879))

(assert (= (and b!167879 res!139784) b!167880))

(declare-fun m!267303 () Bool)

(assert (=> d!58957 m!267303))

(declare-fun m!267305 () Bool)

(assert (=> d!58957 m!267305))

(assert (=> b!167566 d!58957))

(declare-fun d!58959 () Bool)

(declare-fun res!139786 () Bool)

(declare-fun e!116502 () Bool)

(assert (=> d!58959 (=> res!139786 e!116502)))

(assert (=> d!58959 (= res!139786 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (=> d!58959 (= (arrayRangesEq!685 lt!260790 lt!260787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) e!116502)))

(declare-fun b!167881 () Bool)

(declare-fun e!116503 () Bool)

(assert (=> b!167881 (= e!116502 e!116503)))

(declare-fun res!139787 () Bool)

(assert (=> b!167881 (=> (not res!139787) (not e!116503))))

(assert (=> b!167881 (= res!139787 (= (select (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4777 lt!260787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167882 () Bool)

(assert (=> b!167882 (= e!116503 (arrayRangesEq!685 lt!260790 lt!260787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (= (and d!58959 (not res!139786)) b!167881))

(assert (= (and b!167881 res!139787) b!167882))

(declare-fun m!267307 () Bool)

(assert (=> b!167881 m!267307))

(assert (=> b!167881 m!267265))

(declare-fun m!267309 () Bool)

(assert (=> b!167882 m!267309))

(assert (=> b!167602 d!58959))

(declare-fun d!58961 () Bool)

(declare-fun e!116506 () Bool)

(assert (=> d!58961 e!116506))

(declare-fun res!139790 () Bool)

(assert (=> d!58961 (=> (not res!139790) (not e!116506))))

(declare-fun lt!261327 () BitStream!6868)

(declare-fun lt!261328 () (_ BitVec 64))

(assert (=> d!58961 (= res!139790 (= (bvadd lt!261328 (bvsub lt!261052 lt!261047)) (bitIndex!0 (size!3856 (buf!4308 lt!261327)) (currentByte!8153 lt!261327) (currentBit!8148 lt!261327))))))

(assert (=> d!58961 (or (not (= (bvand lt!261328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261052 lt!261047) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261328 (bvsub lt!261052 lt!261047)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!58961 (= lt!261328 (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034))))))

(declare-datatypes ((tuple2!14632 0))(
  ( (tuple2!14633 (_1!7915 Unit!11660) (_2!7915 BitStream!6868)) )
))
(declare-fun moveBitIndex!0 (BitStream!6868 (_ BitVec 64)) tuple2!14632)

(assert (=> d!58961 (= lt!261327 (_2!7915 (moveBitIndex!0 (_2!7903 lt!261034) (bvsub lt!261052 lt!261047))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6868 (_ BitVec 64)) Bool)

(assert (=> d!58961 (moveBitIndexPrecond!0 (_2!7903 lt!261034) (bvsub lt!261052 lt!261047))))

(assert (=> d!58961 (= (withMovedBitIndex!0 (_2!7903 lt!261034) (bvsub lt!261052 lt!261047)) lt!261327)))

(declare-fun b!167885 () Bool)

(assert (=> b!167885 (= e!116506 (= (size!3856 (buf!4308 (_2!7903 lt!261034))) (size!3856 (buf!4308 lt!261327))))))

(assert (= (and d!58961 res!139790) b!167885))

(declare-fun m!267311 () Bool)

(assert (=> d!58961 m!267311))

(assert (=> d!58961 m!267269))

(declare-fun m!267313 () Bool)

(assert (=> d!58961 m!267313))

(declare-fun m!267315 () Bool)

(assert (=> d!58961 m!267315))

(assert (=> b!167654 d!58961))

(assert (=> b!167654 d!58957))

(assert (=> b!167654 d!58709))

(declare-fun d!58963 () Bool)

(declare-fun res!139803 () Bool)

(declare-fun e!116519 () Bool)

(assert (=> d!58963 (=> res!139803 e!116519)))

(assert (=> d!58963 (= res!139803 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))))))

(assert (=> d!58963 (= (arrayBitRangesEq!0 (buf!4308 thiss!1577) (buf!4308 lt!260797) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))) e!116519)))

(declare-fun e!116521 () Bool)

(declare-fun b!167900 () Bool)

(declare-datatypes ((tuple4!248 0))(
  ( (tuple4!249 (_1!7916 (_ BitVec 32)) (_2!7916 (_ BitVec 32)) (_3!599 (_ BitVec 32)) (_4!124 (_ BitVec 32))) )
))
(declare-fun lt!261335 () tuple4!248)

(assert (=> b!167900 (= e!116521 (arrayRangesEq!685 (buf!4308 thiss!1577) (buf!4308 lt!260797) (_1!7916 lt!261335) (_2!7916 lt!261335)))))

(declare-fun b!167901 () Bool)

(declare-fun e!116523 () Bool)

(declare-fun e!116520 () Bool)

(assert (=> b!167901 (= e!116523 e!116520)))

(declare-fun res!139801 () Bool)

(declare-fun call!2821 () Bool)

(assert (=> b!167901 (= res!139801 call!2821)))

(assert (=> b!167901 (=> (not res!139801) (not e!116520))))

(declare-fun b!167902 () Bool)

(assert (=> b!167902 (= e!116523 call!2821)))

(declare-fun b!167903 () Bool)

(declare-fun e!116524 () Bool)

(assert (=> b!167903 (= e!116519 e!116524)))

(declare-fun res!139804 () Bool)

(assert (=> b!167903 (=> (not res!139804) (not e!116524))))

(assert (=> b!167903 (= res!139804 e!116521)))

(declare-fun res!139805 () Bool)

(assert (=> b!167903 (=> res!139805 e!116521)))

(assert (=> b!167903 (= res!139805 (bvsge (_1!7916 lt!261335) (_2!7916 lt!261335)))))

(declare-fun lt!261336 () (_ BitVec 32))

(assert (=> b!167903 (= lt!261336 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261337 () (_ BitVec 32))

(assert (=> b!167903 (= lt!261337 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!248)

(assert (=> b!167903 (= lt!261335 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))))))

(declare-fun b!167904 () Bool)

(declare-fun res!139802 () Bool)

(assert (=> b!167904 (= res!139802 (= lt!261336 #b00000000000000000000000000000000))))

(declare-fun e!116522 () Bool)

(assert (=> b!167904 (=> res!139802 e!116522)))

(assert (=> b!167904 (= e!116520 e!116522)))

(declare-fun c!8662 () Bool)

(declare-fun bm!2818 () Bool)

(assert (=> bm!2818 (= call!2821 (byteRangesEq!0 (select (arr!4777 (buf!4308 thiss!1577)) (_3!599 lt!261335)) (select (arr!4777 (buf!4308 lt!260797)) (_3!599 lt!261335)) lt!261337 (ite c!8662 lt!261336 #b00000000000000000000000000001000)))))

(declare-fun b!167905 () Bool)

(assert (=> b!167905 (= e!116522 (byteRangesEq!0 (select (arr!4777 (buf!4308 thiss!1577)) (_4!124 lt!261335)) (select (arr!4777 (buf!4308 lt!260797)) (_4!124 lt!261335)) #b00000000000000000000000000000000 lt!261336))))

(declare-fun b!167906 () Bool)

(assert (=> b!167906 (= e!116524 e!116523)))

(assert (=> b!167906 (= c!8662 (= (_3!599 lt!261335) (_4!124 lt!261335)))))

(assert (= (and d!58963 (not res!139803)) b!167903))

(assert (= (and b!167903 (not res!139805)) b!167900))

(assert (= (and b!167903 res!139804) b!167906))

(assert (= (and b!167906 c!8662) b!167902))

(assert (= (and b!167906 (not c!8662)) b!167901))

(assert (= (and b!167901 res!139801) b!167904))

(assert (= (and b!167904 (not res!139802)) b!167905))

(assert (= (or b!167902 b!167901) bm!2818))

(declare-fun m!267317 () Bool)

(assert (=> b!167900 m!267317))

(assert (=> b!167903 m!266673))

(declare-fun m!267319 () Bool)

(assert (=> b!167903 m!267319))

(declare-fun m!267321 () Bool)

(assert (=> bm!2818 m!267321))

(declare-fun m!267323 () Bool)

(assert (=> bm!2818 m!267323))

(assert (=> bm!2818 m!267321))

(assert (=> bm!2818 m!267323))

(declare-fun m!267325 () Bool)

(assert (=> bm!2818 m!267325))

(declare-fun m!267327 () Bool)

(assert (=> b!167905 m!267327))

(declare-fun m!267329 () Bool)

(assert (=> b!167905 m!267329))

(assert (=> b!167905 m!267327))

(assert (=> b!167905 m!267329))

(declare-fun m!267331 () Bool)

(assert (=> b!167905 m!267331))

(assert (=> b!167568 d!58963))

(assert (=> b!167568 d!58709))

(declare-fun d!58965 () Bool)

(declare-fun res!139806 () Bool)

(declare-fun e!116526 () Bool)

(assert (=> d!58965 (=> (not res!139806) (not e!116526))))

(assert (=> d!58965 (= res!139806 (= (size!3856 (buf!4308 (_1!7903 lt!261034))) (size!3856 (buf!4308 thiss!1577))))))

(assert (=> d!58965 (= (isPrefixOf!0 (_1!7903 lt!261034) thiss!1577) e!116526)))

(declare-fun b!167907 () Bool)

(declare-fun res!139808 () Bool)

(assert (=> b!167907 (=> (not res!139808) (not e!116526))))

(assert (=> b!167907 (= res!139808 (bvsle (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034))) (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))))))

(declare-fun b!167908 () Bool)

(declare-fun e!116525 () Bool)

(assert (=> b!167908 (= e!116526 e!116525)))

(declare-fun res!139807 () Bool)

(assert (=> b!167908 (=> res!139807 e!116525)))

(assert (=> b!167908 (= res!139807 (= (size!3856 (buf!4308 (_1!7903 lt!261034))) #b00000000000000000000000000000000))))

(declare-fun b!167909 () Bool)

(assert (=> b!167909 (= e!116525 (arrayBitRangesEq!0 (buf!4308 (_1!7903 lt!261034)) (buf!4308 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034)))))))

(assert (= (and d!58965 res!139806) b!167907))

(assert (= (and b!167907 res!139808) b!167908))

(assert (= (and b!167908 (not res!139807)) b!167909))

(assert (=> b!167907 m!267279))

(assert (=> b!167907 m!266673))

(assert (=> b!167909 m!267279))

(assert (=> b!167909 m!267279))

(declare-fun m!267333 () Bool)

(assert (=> b!167909 m!267333))

(assert (=> b!167656 d!58965))

(declare-fun d!58967 () Bool)

(declare-fun res!139809 () Bool)

(declare-fun e!116527 () Bool)

(assert (=> d!58967 (=> res!139809 e!116527)))

(assert (=> d!58967 (= res!139809 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)))))

(assert (=> d!58967 (= (arrayRangesEq!685 (buf!4308 thiss!1577) (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)) e!116527)))

(declare-fun b!167910 () Bool)

(declare-fun e!116528 () Bool)

(assert (=> b!167910 (= e!116527 e!116528)))

(declare-fun res!139810 () Bool)

(assert (=> b!167910 (=> (not res!139810) (not e!116528))))

(assert (=> b!167910 (= res!139810 (= (select (arr!4777 (buf!4308 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4777 (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!167911 () Bool)

(assert (=> b!167911 (= e!116528 (arrayRangesEq!685 (buf!4308 thiss!1577) (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)))))

(assert (= (and d!58967 (not res!139809)) b!167910))

(assert (= (and b!167910 res!139810) b!167911))

(assert (=> b!167910 m!267263))

(declare-fun m!267335 () Bool)

(assert (=> b!167910 m!267335))

(declare-fun m!267337 () Bool)

(assert (=> b!167911 m!267337))

(assert (=> b!167604 d!58967))

(declare-fun d!58969 () Bool)

(assert (=> d!58969 (arrayRangesEq!685 lt!260790 (array!8685 (store (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) (size!3856 lt!260790)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)))))

(assert (=> d!58969 true))

(declare-fun _$8!212 () Unit!11660)

(assert (=> d!58969 (= (choose!255 lt!260790 (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) _$8!212)))

(declare-fun bs!14616 () Bool)

(assert (= bs!14616 d!58969))

(assert (=> bs!14616 m!266827))

(assert (=> bs!14616 m!266829))

(assert (=> d!58719 d!58969))

(assert (=> d!58729 d!58715))

(declare-fun d!58971 () Bool)

(assert (=> d!58971 (arrayRangesEq!685 (buf!4308 thiss!1577) lt!260787 #b00000000000000000000000000000000 (currentByte!8153 thiss!1577))))

(assert (=> d!58971 true))

(declare-fun _$16!83 () Unit!11660)

(assert (=> d!58971 (= (choose!256 (buf!4308 thiss!1577) lt!260790 lt!260787 #b00000000000000000000000000000000 (currentByte!8153 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) _$16!83)))

(declare-fun bs!14617 () Bool)

(assert (= bs!14617 d!58971))

(assert (=> bs!14617 m!266657))

(assert (=> d!58729 d!58971))

(assert (=> b!167657 d!58709))

(declare-fun d!58973 () Bool)

(assert (=> d!58973 (arrayBitRangesEq!0 (buf!4308 lt!260797) (buf!4308 thiss!1577) lt!261040 lt!261037)))

(declare-fun lt!261340 () Unit!11660)

(declare-fun choose!8 (array!8684 array!8684 (_ BitVec 64) (_ BitVec 64)) Unit!11660)

(assert (=> d!58973 (= lt!261340 (choose!8 (buf!4308 thiss!1577) (buf!4308 lt!260797) lt!261040 lt!261037))))

(assert (=> d!58973 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261040) (bvsle lt!261040 lt!261037))))

(assert (=> d!58973 (= (arrayBitRangesEqSymmetric!0 (buf!4308 thiss!1577) (buf!4308 lt!260797) lt!261040 lt!261037) lt!261340)))

(declare-fun bs!14618 () Bool)

(assert (= bs!14618 d!58973))

(assert (=> bs!14618 m!266891))

(declare-fun m!267339 () Bool)

(assert (=> bs!14618 m!267339))

(assert (=> b!167657 d!58973))

(declare-fun d!58975 () Bool)

(declare-fun res!139813 () Bool)

(declare-fun e!116529 () Bool)

(assert (=> d!58975 (=> res!139813 e!116529)))

(assert (=> d!58975 (= res!139813 (bvsge lt!261040 lt!261037))))

(assert (=> d!58975 (= (arrayBitRangesEq!0 (buf!4308 lt!260797) (buf!4308 thiss!1577) lt!261040 lt!261037) e!116529)))

(declare-fun b!167912 () Bool)

(declare-fun e!116531 () Bool)

(declare-fun lt!261341 () tuple4!248)

(assert (=> b!167912 (= e!116531 (arrayRangesEq!685 (buf!4308 lt!260797) (buf!4308 thiss!1577) (_1!7916 lt!261341) (_2!7916 lt!261341)))))

(declare-fun b!167913 () Bool)

(declare-fun e!116533 () Bool)

(declare-fun e!116530 () Bool)

(assert (=> b!167913 (= e!116533 e!116530)))

(declare-fun res!139811 () Bool)

(declare-fun call!2822 () Bool)

(assert (=> b!167913 (= res!139811 call!2822)))

(assert (=> b!167913 (=> (not res!139811) (not e!116530))))

(declare-fun b!167914 () Bool)

(assert (=> b!167914 (= e!116533 call!2822)))

(declare-fun b!167915 () Bool)

(declare-fun e!116534 () Bool)

(assert (=> b!167915 (= e!116529 e!116534)))

(declare-fun res!139814 () Bool)

(assert (=> b!167915 (=> (not res!139814) (not e!116534))))

(assert (=> b!167915 (= res!139814 e!116531)))

(declare-fun res!139815 () Bool)

(assert (=> b!167915 (=> res!139815 e!116531)))

(assert (=> b!167915 (= res!139815 (bvsge (_1!7916 lt!261341) (_2!7916 lt!261341)))))

(declare-fun lt!261342 () (_ BitVec 32))

(assert (=> b!167915 (= lt!261342 ((_ extract 31 0) (bvsrem lt!261037 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261343 () (_ BitVec 32))

(assert (=> b!167915 (= lt!261343 ((_ extract 31 0) (bvsrem lt!261040 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!167915 (= lt!261341 (arrayBitIndices!0 lt!261040 lt!261037))))

(declare-fun b!167916 () Bool)

(declare-fun res!139812 () Bool)

(assert (=> b!167916 (= res!139812 (= lt!261342 #b00000000000000000000000000000000))))

(declare-fun e!116532 () Bool)

(assert (=> b!167916 (=> res!139812 e!116532)))

(assert (=> b!167916 (= e!116530 e!116532)))

(declare-fun bm!2819 () Bool)

(declare-fun c!8663 () Bool)

(assert (=> bm!2819 (= call!2822 (byteRangesEq!0 (select (arr!4777 (buf!4308 lt!260797)) (_3!599 lt!261341)) (select (arr!4777 (buf!4308 thiss!1577)) (_3!599 lt!261341)) lt!261343 (ite c!8663 lt!261342 #b00000000000000000000000000001000)))))

(declare-fun b!167917 () Bool)

(assert (=> b!167917 (= e!116532 (byteRangesEq!0 (select (arr!4777 (buf!4308 lt!260797)) (_4!124 lt!261341)) (select (arr!4777 (buf!4308 thiss!1577)) (_4!124 lt!261341)) #b00000000000000000000000000000000 lt!261342))))

(declare-fun b!167918 () Bool)

(assert (=> b!167918 (= e!116534 e!116533)))

(assert (=> b!167918 (= c!8663 (= (_3!599 lt!261341) (_4!124 lt!261341)))))

(assert (= (and d!58975 (not res!139813)) b!167915))

(assert (= (and b!167915 (not res!139815)) b!167912))

(assert (= (and b!167915 res!139814) b!167918))

(assert (= (and b!167918 c!8663) b!167914))

(assert (= (and b!167918 (not c!8663)) b!167913))

(assert (= (and b!167913 res!139811) b!167916))

(assert (= (and b!167916 (not res!139812)) b!167917))

(assert (= (or b!167914 b!167913) bm!2819))

(declare-fun m!267341 () Bool)

(assert (=> b!167912 m!267341))

(declare-fun m!267343 () Bool)

(assert (=> b!167915 m!267343))

(declare-fun m!267345 () Bool)

(assert (=> bm!2819 m!267345))

(declare-fun m!267347 () Bool)

(assert (=> bm!2819 m!267347))

(assert (=> bm!2819 m!267345))

(assert (=> bm!2819 m!267347))

(declare-fun m!267349 () Bool)

(assert (=> bm!2819 m!267349))

(declare-fun m!267351 () Bool)

(assert (=> b!167917 m!267351))

(declare-fun m!267353 () Bool)

(assert (=> b!167917 m!267353))

(assert (=> b!167917 m!267351))

(assert (=> b!167917 m!267353))

(declare-fun m!267355 () Bool)

(assert (=> b!167917 m!267355))

(assert (=> b!167657 d!58975))

(declare-fun d!58977 () Bool)

(declare-fun e!116540 () Bool)

(assert (=> d!58977 e!116540))

(declare-fun res!139818 () Bool)

(assert (=> d!58977 (=> (not res!139818) (not e!116540))))

(declare-fun lt!261359 () tuple2!14624)

(assert (=> d!58977 (= res!139818 (= (buf!4308 (_2!7909 lt!261359)) (buf!4308 (_1!7903 lt!260794))))))

(declare-datatypes ((tuple3!950 0))(
  ( (tuple3!951 (_1!7917 Unit!11660) (_2!7917 (_ BitVec 8)) (_3!600 BitStream!6868)) )
))
(declare-fun lt!261358 () tuple3!950)

(assert (=> d!58977 (= lt!261359 (tuple2!14625 (_2!7917 lt!261358) (_3!600 lt!261358)))))

(declare-fun e!116539 () tuple3!950)

(assert (=> d!58977 (= lt!261358 e!116539)))

(declare-fun c!8666 () Bool)

(declare-fun lt!261360 () (_ BitVec 32))

(assert (=> d!58977 (= c!8666 (bvsle lt!261360 #b00000000000000000000000000001000))))

(assert (=> d!58977 (= lt!261360 (bvadd (currentBit!8148 (_1!7903 lt!260794)) nBits!511))))

(assert (=> d!58977 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000))))

(assert (=> d!58977 (= (readPartialByte!0 (_1!7903 lt!260794) nBits!511) lt!261359)))

(declare-fun lt!261363 () tuple2!14632)

(declare-fun b!167925 () Bool)

(assert (=> b!167925 (= e!116539 (tuple3!951 (_1!7915 lt!261363) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4777 (buf!4308 (_1!7903 lt!260794))) (currentByte!8153 (_1!7903 lt!260794)))) (bvsub #b00000000000000000000000000001000 lt!261360)) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (_2!7915 lt!261363)))))

(assert (=> b!167925 (= lt!261363 (moveBitIndex!0 (_1!7903 lt!260794) ((_ sign_extend 32) nBits!511)))))

(declare-fun lt!261362 () (_ BitVec 32))

(declare-fun b!167926 () Bool)

(declare-fun Unit!11682 () Unit!11660)

(assert (=> b!167926 (= e!116539 (tuple3!951 Unit!11682 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4777 (buf!4308 (_1!7903 lt!260794))) (currentByte!8153 (_1!7903 lt!260794)))) lt!261362))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 (_1!7903 lt!260794))) (bvadd (currentByte!8153 (_1!7903 lt!260794)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261362))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511)))) (BitStream!6869 (buf!4308 (_1!7903 lt!260794)) (bvadd (currentByte!8153 (_1!7903 lt!260794)) #b00000000000000000000000000000001) lt!261362)))))

(assert (=> b!167926 (= lt!261362 (bvsub lt!261360 #b00000000000000000000000000001000))))

(declare-fun b!167927 () Bool)

(declare-fun lt!261361 () (_ BitVec 64))

(declare-fun lt!261364 () (_ BitVec 64))

(assert (=> b!167927 (= e!116540 (= (bitIndex!0 (size!3856 (buf!4308 (_2!7909 lt!261359))) (currentByte!8153 (_2!7909 lt!261359)) (currentBit!8148 (_2!7909 lt!261359))) (bvadd lt!261364 lt!261361)))))

(assert (=> b!167927 (or (not (= (bvand lt!261364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261361 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261364 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261364 lt!261361) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!167927 (= lt!261361 ((_ sign_extend 32) nBits!511))))

(assert (=> b!167927 (= lt!261364 (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!260794))) (currentByte!8153 (_1!7903 lt!260794)) (currentBit!8148 (_1!7903 lt!260794))))))

(assert (= (and d!58977 c!8666) b!167925))

(assert (= (and d!58977 (not c!8666)) b!167926))

(assert (= (and d!58977 res!139818) b!167927))

(declare-fun m!267357 () Bool)

(assert (=> b!167925 m!267357))

(assert (=> b!167925 m!266677))

(declare-fun m!267359 () Bool)

(assert (=> b!167925 m!267359))

(assert (=> b!167926 m!267357))

(declare-fun m!267361 () Bool)

(assert (=> b!167926 m!267361))

(assert (=> b!167926 m!266677))

(declare-fun m!267363 () Bool)

(assert (=> b!167927 m!267363))

(declare-fun m!267365 () Bool)

(assert (=> b!167927 m!267365))

(assert (=> d!58741 d!58977))

(declare-fun d!58979 () Bool)

(assert (=> d!58979 (arrayRangesEq!685 (buf!4308 thiss!1577) (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8153 thiss!1577))))

(assert (=> d!58979 true))

(declare-fun _$8!213 () Unit!11660)

(assert (=> d!58979 (= (choose!255 (buf!4308 thiss!1577) (currentByte!8153 thiss!1577) lt!260795) _$8!213)))

(declare-fun bs!14619 () Bool)

(assert (= bs!14619 d!58979))

(assert (=> bs!14619 m!266659))

(assert (=> bs!14619 m!266655))

(assert (=> d!58731 d!58979))

(push 1)

(assert (not b!167867))

(assert (not bm!2819))

(assert (not b!167859))

(assert (not b!167858))

(assert (not b!167917))

(assert (not b!167909))

(assert (not b!167876))

(assert (not d!58973))

(assert (not d!58941))

(assert (not b!167915))

(assert (not b!167864))

(assert (not b!167882))

(assert (not b!167912))

(assert (not d!58933))

(assert (not b!167911))

(assert (not d!58961))

(assert (not b!167878))

(assert (not bm!2818))

(assert (not d!58969))

(assert (not d!58939))

(assert (not b!167903))

(assert (not d!58937))

(assert (not b!167861))

(assert (not d!58957))

(assert (not b!167870))

(assert (not d!58935))

(assert (not b!167869))

(assert (not b!167872))

(assert (not d!58971))

(assert (not b!167927))

(assert (not b!167907))

(assert (not b!167863))

(assert (not b!167875))

(assert (not b!167873))

(assert (not d!58979))

(assert (not b!167866))

(assert (not b!167905))

(assert (not b!167925))

(assert (not b!167900))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!59039 () Bool)

(declare-fun res!139878 () Bool)

(declare-fun e!116597 () Bool)

(assert (=> d!59039 (=> res!139878 e!116597)))

(assert (=> d!59039 (= res!139878 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045))))))

(assert (=> d!59039 (= (arrayBitRangesEq!0 (buf!4308 lt!261045) (buf!4308 lt!261045) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045))) e!116597)))

(declare-fun b!167999 () Bool)

(declare-fun e!116599 () Bool)

(declare-fun lt!261422 () tuple4!248)

(assert (=> b!167999 (= e!116599 (arrayRangesEq!685 (buf!4308 lt!261045) (buf!4308 lt!261045) (_1!7916 lt!261422) (_2!7916 lt!261422)))))

(declare-fun b!168000 () Bool)

(declare-fun e!116601 () Bool)

(declare-fun e!116598 () Bool)

(assert (=> b!168000 (= e!116601 e!116598)))

(declare-fun res!139876 () Bool)

(declare-fun call!2827 () Bool)

(assert (=> b!168000 (= res!139876 call!2827)))

(assert (=> b!168000 (=> (not res!139876) (not e!116598))))

(declare-fun b!168001 () Bool)

(assert (=> b!168001 (= e!116601 call!2827)))

(declare-fun b!168002 () Bool)

(declare-fun e!116602 () Bool)

(assert (=> b!168002 (= e!116597 e!116602)))

(declare-fun res!139879 () Bool)

(assert (=> b!168002 (=> (not res!139879) (not e!116602))))

(assert (=> b!168002 (= res!139879 e!116599)))

(declare-fun res!139880 () Bool)

(assert (=> b!168002 (=> res!139880 e!116599)))

(assert (=> b!168002 (= res!139880 (bvsge (_1!7916 lt!261422) (_2!7916 lt!261422)))))

(declare-fun lt!261423 () (_ BitVec 32))

(assert (=> b!168002 (= lt!261423 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261424 () (_ BitVec 32))

(assert (=> b!168002 (= lt!261424 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168002 (= lt!261422 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045))))))

(declare-fun b!168003 () Bool)

(declare-fun res!139877 () Bool)

(assert (=> b!168003 (= res!139877 (= lt!261423 #b00000000000000000000000000000000))))

(declare-fun e!116600 () Bool)

(assert (=> b!168003 (=> res!139877 e!116600)))

(assert (=> b!168003 (= e!116598 e!116600)))

(declare-fun bm!2824 () Bool)

(declare-fun c!8674 () Bool)

(assert (=> bm!2824 (= call!2827 (byteRangesEq!0 (select (arr!4777 (buf!4308 lt!261045)) (_3!599 lt!261422)) (select (arr!4777 (buf!4308 lt!261045)) (_3!599 lt!261422)) lt!261424 (ite c!8674 lt!261423 #b00000000000000000000000000001000)))))

(declare-fun b!168004 () Bool)

(assert (=> b!168004 (= e!116600 (byteRangesEq!0 (select (arr!4777 (buf!4308 lt!261045)) (_4!124 lt!261422)) (select (arr!4777 (buf!4308 lt!261045)) (_4!124 lt!261422)) #b00000000000000000000000000000000 lt!261423))))

(declare-fun b!168005 () Bool)

(assert (=> b!168005 (= e!116602 e!116601)))

(assert (=> b!168005 (= c!8674 (= (_3!599 lt!261422) (_4!124 lt!261422)))))

(assert (= (and d!59039 (not res!139878)) b!168002))

(assert (= (and b!168002 (not res!139880)) b!167999))

(assert (= (and b!168002 res!139879) b!168005))

(assert (= (and b!168005 c!8674) b!168001))

(assert (= (and b!168005 (not c!8674)) b!168000))

(assert (= (and b!168000 res!139876) b!168003))

(assert (= (and b!168003 (not res!139877)) b!168004))

(assert (= (or b!168001 b!168000) bm!2824))

(declare-fun m!267471 () Bool)

(assert (=> b!167999 m!267471))

(assert (=> b!168002 m!267297))

(declare-fun m!267473 () Bool)

(assert (=> b!168002 m!267473))

(declare-fun m!267475 () Bool)

(assert (=> bm!2824 m!267475))

(assert (=> bm!2824 m!267475))

(assert (=> bm!2824 m!267475))

(assert (=> bm!2824 m!267475))

(declare-fun m!267477 () Bool)

(assert (=> bm!2824 m!267477))

(declare-fun m!267479 () Bool)

(assert (=> b!168004 m!267479))

(assert (=> b!168004 m!267479))

(assert (=> b!168004 m!267479))

(assert (=> b!168004 m!267479))

(declare-fun m!267481 () Bool)

(assert (=> b!168004 m!267481))

(assert (=> b!167875 d!59039))

(declare-fun d!59041 () Bool)

(declare-fun e!116603 () Bool)

(assert (=> d!59041 e!116603))

(declare-fun res!139882 () Bool)

(assert (=> d!59041 (=> (not res!139882) (not e!116603))))

(declare-fun lt!261429 () (_ BitVec 64))

(declare-fun lt!261426 () (_ BitVec 64))

(declare-fun lt!261430 () (_ BitVec 64))

(assert (=> d!59041 (= res!139882 (= lt!261426 (bvsub lt!261430 lt!261429)))))

(assert (=> d!59041 (or (= (bvand lt!261430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261429 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261430 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261430 lt!261429) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59041 (= lt!261429 (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 lt!261045))) ((_ sign_extend 32) (currentByte!8153 lt!261045)) ((_ sign_extend 32) (currentBit!8148 lt!261045))))))

(declare-fun lt!261427 () (_ BitVec 64))

(declare-fun lt!261425 () (_ BitVec 64))

(assert (=> d!59041 (= lt!261430 (bvmul lt!261427 lt!261425))))

(assert (=> d!59041 (or (= lt!261427 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261425 (bvsdiv (bvmul lt!261427 lt!261425) lt!261427)))))

(assert (=> d!59041 (= lt!261425 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59041 (= lt!261427 ((_ sign_extend 32) (size!3856 (buf!4308 lt!261045))))))

(assert (=> d!59041 (= lt!261426 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8153 lt!261045)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8148 lt!261045))))))

(assert (=> d!59041 (invariant!0 (currentBit!8148 lt!261045) (currentByte!8153 lt!261045) (size!3856 (buf!4308 lt!261045)))))

(assert (=> d!59041 (= (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045)) lt!261426)))

(declare-fun b!168006 () Bool)

(declare-fun res!139881 () Bool)

(assert (=> b!168006 (=> (not res!139881) (not e!116603))))

(assert (=> b!168006 (= res!139881 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261426))))

(declare-fun b!168007 () Bool)

(declare-fun lt!261428 () (_ BitVec 64))

(assert (=> b!168007 (= e!116603 (bvsle lt!261426 (bvmul lt!261428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168007 (or (= lt!261428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261428)))))

(assert (=> b!168007 (= lt!261428 ((_ sign_extend 32) (size!3856 (buf!4308 lt!261045))))))

(assert (= (and d!59041 res!139882) b!168006))

(assert (= (and b!168006 res!139881) b!168007))

(declare-fun m!267483 () Bool)

(assert (=> d!59041 m!267483))

(declare-fun m!267485 () Bool)

(assert (=> d!59041 m!267485))

(assert (=> b!167875 d!59041))

(assert (=> d!58933 d!58929))

(declare-fun d!59043 () Bool)

(assert (=> d!59043 (isPrefixOf!0 lt!260797 lt!260797)))

(assert (=> d!59043 true))

(declare-fun _$14!312 () Unit!11660)

(assert (=> d!59043 (= (choose!11 lt!260797) _$14!312)))

(declare-fun bs!14631 () Bool)

(assert (= bs!14631 d!59043))

(assert (=> bs!14631 m!266911))

(assert (=> d!58933 d!59043))

(declare-fun d!59045 () Bool)

(declare-fun e!116604 () Bool)

(assert (=> d!59045 e!116604))

(declare-fun res!139884 () Bool)

(assert (=> d!59045 (=> (not res!139884) (not e!116604))))

(declare-fun lt!261436 () (_ BitVec 64))

(declare-fun lt!261432 () (_ BitVec 64))

(declare-fun lt!261435 () (_ BitVec 64))

(assert (=> d!59045 (= res!139884 (= lt!261432 (bvsub lt!261436 lt!261435)))))

(assert (=> d!59045 (or (= (bvand lt!261436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261435 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261436 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261436 lt!261435) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59045 (= lt!261435 (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 lt!261327))) ((_ sign_extend 32) (currentByte!8153 lt!261327)) ((_ sign_extend 32) (currentBit!8148 lt!261327))))))

(declare-fun lt!261433 () (_ BitVec 64))

(declare-fun lt!261431 () (_ BitVec 64))

(assert (=> d!59045 (= lt!261436 (bvmul lt!261433 lt!261431))))

(assert (=> d!59045 (or (= lt!261433 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261431 (bvsdiv (bvmul lt!261433 lt!261431) lt!261433)))))

(assert (=> d!59045 (= lt!261431 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59045 (= lt!261433 ((_ sign_extend 32) (size!3856 (buf!4308 lt!261327))))))

(assert (=> d!59045 (= lt!261432 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8153 lt!261327)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8148 lt!261327))))))

(assert (=> d!59045 (invariant!0 (currentBit!8148 lt!261327) (currentByte!8153 lt!261327) (size!3856 (buf!4308 lt!261327)))))

(assert (=> d!59045 (= (bitIndex!0 (size!3856 (buf!4308 lt!261327)) (currentByte!8153 lt!261327) (currentBit!8148 lt!261327)) lt!261432)))

(declare-fun b!168008 () Bool)

(declare-fun res!139883 () Bool)

(assert (=> b!168008 (=> (not res!139883) (not e!116604))))

(assert (=> b!168008 (= res!139883 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261432))))

(declare-fun b!168009 () Bool)

(declare-fun lt!261434 () (_ BitVec 64))

(assert (=> b!168009 (= e!116604 (bvsle lt!261432 (bvmul lt!261434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168009 (or (= lt!261434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261434)))))

(assert (=> b!168009 (= lt!261434 ((_ sign_extend 32) (size!3856 (buf!4308 lt!261327))))))

(assert (= (and d!59045 res!139884) b!168008))

(assert (= (and b!168008 res!139883) b!168009))

(declare-fun m!267487 () Bool)

(assert (=> d!59045 m!267487))

(declare-fun m!267489 () Bool)

(assert (=> d!59045 m!267489))

(assert (=> d!58961 d!59045))

(declare-fun d!59047 () Bool)

(declare-fun e!116605 () Bool)

(assert (=> d!59047 e!116605))

(declare-fun res!139886 () Bool)

(assert (=> d!59047 (=> (not res!139886) (not e!116605))))

(declare-fun lt!261442 () (_ BitVec 64))

(declare-fun lt!261441 () (_ BitVec 64))

(declare-fun lt!261438 () (_ BitVec 64))

(assert (=> d!59047 (= res!139886 (= lt!261438 (bvsub lt!261442 lt!261441)))))

(assert (=> d!59047 (or (= (bvand lt!261442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261441 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261442 lt!261441) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59047 (= lt!261441 (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 (_2!7903 lt!261034)))) ((_ sign_extend 32) (currentByte!8153 (_2!7903 lt!261034))) ((_ sign_extend 32) (currentBit!8148 (_2!7903 lt!261034)))))))

(declare-fun lt!261439 () (_ BitVec 64))

(declare-fun lt!261437 () (_ BitVec 64))

(assert (=> d!59047 (= lt!261442 (bvmul lt!261439 lt!261437))))

(assert (=> d!59047 (or (= lt!261439 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261437 (bvsdiv (bvmul lt!261439 lt!261437) lt!261439)))))

(assert (=> d!59047 (= lt!261437 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59047 (= lt!261439 ((_ sign_extend 32) (size!3856 (buf!4308 (_2!7903 lt!261034)))))))

(assert (=> d!59047 (= lt!261438 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8153 (_2!7903 lt!261034))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8148 (_2!7903 lt!261034)))))))

(assert (=> d!59047 (invariant!0 (currentBit!8148 (_2!7903 lt!261034)) (currentByte!8153 (_2!7903 lt!261034)) (size!3856 (buf!4308 (_2!7903 lt!261034))))))

(assert (=> d!59047 (= (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034))) lt!261438)))

(declare-fun b!168010 () Bool)

(declare-fun res!139885 () Bool)

(assert (=> b!168010 (=> (not res!139885) (not e!116605))))

(assert (=> b!168010 (= res!139885 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261438))))

(declare-fun b!168011 () Bool)

(declare-fun lt!261440 () (_ BitVec 64))

(assert (=> b!168011 (= e!116605 (bvsle lt!261438 (bvmul lt!261440 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168011 (or (= lt!261440 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261440 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261440)))))

(assert (=> b!168011 (= lt!261440 ((_ sign_extend 32) (size!3856 (buf!4308 (_2!7903 lt!261034)))))))

(assert (= (and d!59047 res!139886) b!168010))

(assert (= (and b!168010 res!139885) b!168011))

(declare-fun m!267491 () Bool)

(assert (=> d!59047 m!267491))

(declare-fun m!267493 () Bool)

(assert (=> d!59047 m!267493))

(assert (=> d!58961 d!59047))

(declare-fun d!59049 () Bool)

(declare-fun lt!261456 () (_ BitVec 32))

(assert (=> d!59049 (= lt!261456 ((_ extract 31 0) (bvsrem (bvsub lt!261052 lt!261047) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261458 () (_ BitVec 32))

(assert (=> d!59049 (= lt!261458 ((_ extract 31 0) (bvsdiv (bvsub lt!261052 lt!261047) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!116611 () Bool)

(assert (=> d!59049 e!116611))

(declare-fun res!139891 () Bool)

(assert (=> d!59049 (=> (not res!139891) (not e!116611))))

(assert (=> d!59049 (= res!139891 (moveBitIndexPrecond!0 (_2!7903 lt!261034) (bvsub lt!261052 lt!261047)))))

(declare-fun Unit!11684 () Unit!11660)

(declare-fun Unit!11685 () Unit!11660)

(declare-fun Unit!11686 () Unit!11660)

(assert (=> d!59049 (= (moveBitIndex!0 (_2!7903 lt!261034) (bvsub lt!261052 lt!261047)) (ite (bvslt (bvadd (currentBit!8148 (_2!7903 lt!261034)) lt!261456) #b00000000000000000000000000000000) (tuple2!14633 Unit!11684 (BitStream!6869 (buf!4308 (_2!7903 lt!261034)) (bvsub (bvadd (currentByte!8153 (_2!7903 lt!261034)) lt!261458) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261456 (currentBit!8148 (_2!7903 lt!261034))))) (ite (bvsge (bvadd (currentBit!8148 (_2!7903 lt!261034)) lt!261456) #b00000000000000000000000000001000) (tuple2!14633 Unit!11685 (BitStream!6869 (buf!4308 (_2!7903 lt!261034)) (bvadd (currentByte!8153 (_2!7903 lt!261034)) lt!261458 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8148 (_2!7903 lt!261034)) lt!261456) #b00000000000000000000000000001000))) (tuple2!14633 Unit!11686 (BitStream!6869 (buf!4308 (_2!7903 lt!261034)) (bvadd (currentByte!8153 (_2!7903 lt!261034)) lt!261458) (bvadd (currentBit!8148 (_2!7903 lt!261034)) lt!261456))))))))

(declare-fun b!168016 () Bool)

(declare-fun e!116610 () Bool)

(assert (=> b!168016 (= e!116611 e!116610)))

(declare-fun res!139892 () Bool)

(assert (=> b!168016 (=> (not res!139892) (not e!116610))))

(declare-fun lt!261459 () (_ BitVec 64))

(declare-fun lt!261455 () tuple2!14632)

(assert (=> b!168016 (= res!139892 (= (bvadd lt!261459 (bvsub lt!261052 lt!261047)) (bitIndex!0 (size!3856 (buf!4308 (_2!7915 lt!261455))) (currentByte!8153 (_2!7915 lt!261455)) (currentBit!8148 (_2!7915 lt!261455)))))))

(assert (=> b!168016 (or (not (= (bvand lt!261459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261052 lt!261047) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261459 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261459 (bvsub lt!261052 lt!261047)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!168016 (= lt!261459 (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034))))))

(declare-fun lt!261460 () (_ BitVec 32))

(declare-fun lt!261457 () (_ BitVec 32))

(declare-fun Unit!11687 () Unit!11660)

(declare-fun Unit!11688 () Unit!11660)

(declare-fun Unit!11689 () Unit!11660)

(assert (=> b!168016 (= lt!261455 (ite (bvslt (bvadd (currentBit!8148 (_2!7903 lt!261034)) lt!261460) #b00000000000000000000000000000000) (tuple2!14633 Unit!11687 (BitStream!6869 (buf!4308 (_2!7903 lt!261034)) (bvsub (bvadd (currentByte!8153 (_2!7903 lt!261034)) lt!261457) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261460 (currentBit!8148 (_2!7903 lt!261034))))) (ite (bvsge (bvadd (currentBit!8148 (_2!7903 lt!261034)) lt!261460) #b00000000000000000000000000001000) (tuple2!14633 Unit!11688 (BitStream!6869 (buf!4308 (_2!7903 lt!261034)) (bvadd (currentByte!8153 (_2!7903 lt!261034)) lt!261457 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8148 (_2!7903 lt!261034)) lt!261460) #b00000000000000000000000000001000))) (tuple2!14633 Unit!11689 (BitStream!6869 (buf!4308 (_2!7903 lt!261034)) (bvadd (currentByte!8153 (_2!7903 lt!261034)) lt!261457) (bvadd (currentBit!8148 (_2!7903 lt!261034)) lt!261460))))))))

(assert (=> b!168016 (= lt!261460 ((_ extract 31 0) (bvsrem (bvsub lt!261052 lt!261047) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168016 (= lt!261457 ((_ extract 31 0) (bvsdiv (bvsub lt!261052 lt!261047) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!168017 () Bool)

(assert (=> b!168017 (= e!116610 (and (= (size!3856 (buf!4308 (_2!7903 lt!261034))) (size!3856 (buf!4308 (_2!7915 lt!261455)))) (= (buf!4308 (_2!7903 lt!261034)) (buf!4308 (_2!7915 lt!261455)))))))

(assert (= (and d!59049 res!139891) b!168016))

(assert (= (and b!168016 res!139892) b!168017))

(assert (=> d!59049 m!267315))

(declare-fun m!267495 () Bool)

(assert (=> b!168016 m!267495))

(assert (=> b!168016 m!267269))

(assert (=> d!58961 d!59049))

(declare-fun d!59053 () Bool)

(declare-fun res!139895 () Bool)

(declare-fun e!116614 () Bool)

(assert (=> d!59053 (=> (not res!139895) (not e!116614))))

(assert (=> d!59053 (= res!139895 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!3856 (buf!4308 (_2!7903 lt!261034))))) (bvsub lt!261052 lt!261047)) (bvsle (bvsub lt!261052 lt!261047) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3856 (buf!4308 (_2!7903 lt!261034))))))))))

(assert (=> d!59053 (= (moveBitIndexPrecond!0 (_2!7903 lt!261034) (bvsub lt!261052 lt!261047)) e!116614)))

(declare-fun b!168021 () Bool)

(declare-fun lt!261463 () (_ BitVec 64))

(assert (=> b!168021 (= e!116614 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261463) (bvsle lt!261463 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3856 (buf!4308 (_2!7903 lt!261034))))))))))

(assert (=> b!168021 (= lt!261463 (bvadd (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034))) (bvsub lt!261052 lt!261047)))))

(assert (= (and d!59053 res!139895) b!168021))

(assert (=> b!168021 m!267269))

(assert (=> d!58961 d!59053))

(assert (=> d!58939 d!58947))

(declare-fun d!59055 () Bool)

(assert (=> d!59055 (isPrefixOf!0 lt!261045 lt!260797)))

(assert (=> d!59055 true))

(declare-fun _$15!280 () Unit!11660)

(assert (=> d!59055 (= (choose!30 lt!261045 lt!260797 lt!260797) _$15!280)))

(declare-fun bs!14632 () Bool)

(assert (= bs!14632 d!59055))

(assert (=> bs!14632 m!266895))

(assert (=> d!58939 d!59055))

(assert (=> b!167864 d!58957))

(assert (=> d!58973 d!58975))

(declare-fun d!59057 () Bool)

(assert (=> d!59057 (arrayBitRangesEq!0 (buf!4308 lt!260797) (buf!4308 thiss!1577) lt!261040 lt!261037)))

(assert (=> d!59057 true))

(declare-fun _$19!147 () Unit!11660)

(assert (=> d!59057 (= (choose!8 (buf!4308 thiss!1577) (buf!4308 lt!260797) lt!261040 lt!261037) _$19!147)))

(declare-fun bs!14633 () Bool)

(assert (= bs!14633 d!59057))

(assert (=> bs!14633 m!266891))

(assert (=> d!58973 d!59057))

(declare-fun d!59059 () Bool)

(declare-fun e!116615 () Bool)

(assert (=> d!59059 e!116615))

(declare-fun res!139897 () Bool)

(assert (=> d!59059 (=> (not res!139897) (not e!116615))))

(declare-fun lt!261468 () (_ BitVec 64))

(declare-fun lt!261465 () (_ BitVec 64))

(declare-fun lt!261469 () (_ BitVec 64))

(assert (=> d!59059 (= res!139897 (= lt!261465 (bvsub lt!261469 lt!261468)))))

(assert (=> d!59059 (or (= (bvand lt!261469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261468 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261469 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261469 lt!261468) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59059 (= lt!261468 (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 (_1!7903 lt!261034)))) ((_ sign_extend 32) (currentByte!8153 (_1!7903 lt!261034))) ((_ sign_extend 32) (currentBit!8148 (_1!7903 lt!261034)))))))

(declare-fun lt!261466 () (_ BitVec 64))

(declare-fun lt!261464 () (_ BitVec 64))

(assert (=> d!59059 (= lt!261469 (bvmul lt!261466 lt!261464))))

(assert (=> d!59059 (or (= lt!261466 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261464 (bvsdiv (bvmul lt!261466 lt!261464) lt!261466)))))

(assert (=> d!59059 (= lt!261464 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59059 (= lt!261466 ((_ sign_extend 32) (size!3856 (buf!4308 (_1!7903 lt!261034)))))))

(assert (=> d!59059 (= lt!261465 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8153 (_1!7903 lt!261034))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8148 (_1!7903 lt!261034)))))))

(assert (=> d!59059 (invariant!0 (currentBit!8148 (_1!7903 lt!261034)) (currentByte!8153 (_1!7903 lt!261034)) (size!3856 (buf!4308 (_1!7903 lt!261034))))))

(assert (=> d!59059 (= (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034))) lt!261465)))

(declare-fun b!168022 () Bool)

(declare-fun res!139896 () Bool)

(assert (=> b!168022 (=> (not res!139896) (not e!116615))))

(assert (=> b!168022 (= res!139896 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261465))))

(declare-fun b!168023 () Bool)

(declare-fun lt!261467 () (_ BitVec 64))

(assert (=> b!168023 (= e!116615 (bvsle lt!261465 (bvmul lt!261467 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168023 (or (= lt!261467 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261467 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261467)))))

(assert (=> b!168023 (= lt!261467 ((_ sign_extend 32) (size!3856 (buf!4308 (_1!7903 lt!261034)))))))

(assert (= (and d!59059 res!139897) b!168022))

(assert (= (and b!168022 res!139896) b!168023))

(declare-fun m!267497 () Bool)

(assert (=> d!59059 m!267497))

(declare-fun m!267499 () Bool)

(assert (=> d!59059 m!267499))

(assert (=> b!167907 d!59059))

(assert (=> b!167907 d!58709))

(declare-fun d!59061 () Bool)

(declare-fun res!139900 () Bool)

(declare-fun e!116616 () Bool)

(assert (=> d!59061 (=> res!139900 e!116616)))

(assert (=> d!59061 (= res!139900 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797))))))

(assert (=> d!59061 (= (arrayBitRangesEq!0 (buf!4308 lt!260797) (buf!4308 lt!260797) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797))) e!116616)))

(declare-fun b!168024 () Bool)

(declare-fun e!116618 () Bool)

(declare-fun lt!261470 () tuple4!248)

(assert (=> b!168024 (= e!116618 (arrayRangesEq!685 (buf!4308 lt!260797) (buf!4308 lt!260797) (_1!7916 lt!261470) (_2!7916 lt!261470)))))

(declare-fun b!168025 () Bool)

(declare-fun e!116620 () Bool)

(declare-fun e!116617 () Bool)

(assert (=> b!168025 (= e!116620 e!116617)))

(declare-fun res!139898 () Bool)

(declare-fun call!2828 () Bool)

(assert (=> b!168025 (= res!139898 call!2828)))

(assert (=> b!168025 (=> (not res!139898) (not e!116617))))

(declare-fun b!168026 () Bool)

(assert (=> b!168026 (= e!116620 call!2828)))

(declare-fun b!168027 () Bool)

(declare-fun e!116621 () Bool)

(assert (=> b!168027 (= e!116616 e!116621)))

(declare-fun res!139901 () Bool)

(assert (=> b!168027 (=> (not res!139901) (not e!116621))))

(assert (=> b!168027 (= res!139901 e!116618)))

(declare-fun res!139902 () Bool)

(assert (=> b!168027 (=> res!139902 e!116618)))

(assert (=> b!168027 (= res!139902 (bvsge (_1!7916 lt!261470) (_2!7916 lt!261470)))))

(declare-fun lt!261471 () (_ BitVec 32))

(assert (=> b!168027 (= lt!261471 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261472 () (_ BitVec 32))

(assert (=> b!168027 (= lt!261472 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168027 (= lt!261470 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!260797)) (currentByte!8153 lt!260797) (currentBit!8148 lt!260797))))))

(declare-fun b!168028 () Bool)

(declare-fun res!139899 () Bool)

(assert (=> b!168028 (= res!139899 (= lt!261471 #b00000000000000000000000000000000))))

(declare-fun e!116619 () Bool)

(assert (=> b!168028 (=> res!139899 e!116619)))

(assert (=> b!168028 (= e!116617 e!116619)))

(declare-fun bm!2825 () Bool)

(declare-fun c!8675 () Bool)

(assert (=> bm!2825 (= call!2828 (byteRangesEq!0 (select (arr!4777 (buf!4308 lt!260797)) (_3!599 lt!261470)) (select (arr!4777 (buf!4308 lt!260797)) (_3!599 lt!261470)) lt!261472 (ite c!8675 lt!261471 #b00000000000000000000000000001000)))))

(declare-fun b!168029 () Bool)

(assert (=> b!168029 (= e!116619 (byteRangesEq!0 (select (arr!4777 (buf!4308 lt!260797)) (_4!124 lt!261470)) (select (arr!4777 (buf!4308 lt!260797)) (_4!124 lt!261470)) #b00000000000000000000000000000000 lt!261471))))

(declare-fun b!168030 () Bool)

(assert (=> b!168030 (= e!116621 e!116620)))

(assert (=> b!168030 (= c!8675 (= (_3!599 lt!261470) (_4!124 lt!261470)))))

(assert (= (and d!59061 (not res!139900)) b!168027))

(assert (= (and b!168027 (not res!139902)) b!168024))

(assert (= (and b!168027 res!139901) b!168030))

(assert (= (and b!168030 c!8675) b!168026))

(assert (= (and b!168030 (not c!8675)) b!168025))

(assert (= (and b!168025 res!139898) b!168028))

(assert (= (and b!168028 (not res!139899)) b!168029))

(assert (= (or b!168026 b!168025) bm!2825))

(declare-fun m!267501 () Bool)

(assert (=> b!168024 m!267501))

(assert (=> b!168027 m!266775))

(declare-fun m!267503 () Bool)

(assert (=> b!168027 m!267503))

(declare-fun m!267505 () Bool)

(assert (=> bm!2825 m!267505))

(assert (=> bm!2825 m!267505))

(assert (=> bm!2825 m!267505))

(assert (=> bm!2825 m!267505))

(declare-fun m!267507 () Bool)

(assert (=> bm!2825 m!267507))

(declare-fun m!267509 () Bool)

(assert (=> b!168029 m!267509))

(assert (=> b!168029 m!267509))

(assert (=> b!168029 m!267509))

(assert (=> b!168029 m!267509))

(declare-fun m!267511 () Bool)

(assert (=> b!168029 m!267511))

(assert (=> b!167866 d!59061))

(assert (=> b!167866 d!58957))

(declare-fun d!59063 () Bool)

(declare-fun res!139905 () Bool)

(declare-fun e!116622 () Bool)

(assert (=> d!59063 (=> res!139905 e!116622)))

(assert (=> d!59063 (= res!139905 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034)))))))

(assert (=> d!59063 (= (arrayBitRangesEq!0 (buf!4308 (_1!7903 lt!261034)) (buf!4308 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034)))) e!116622)))

(declare-fun b!168031 () Bool)

(declare-fun lt!261473 () tuple4!248)

(declare-fun e!116624 () Bool)

(assert (=> b!168031 (= e!116624 (arrayRangesEq!685 (buf!4308 (_1!7903 lt!261034)) (buf!4308 thiss!1577) (_1!7916 lt!261473) (_2!7916 lt!261473)))))

(declare-fun b!168032 () Bool)

(declare-fun e!116626 () Bool)

(declare-fun e!116623 () Bool)

(assert (=> b!168032 (= e!116626 e!116623)))

(declare-fun res!139903 () Bool)

(declare-fun call!2829 () Bool)

(assert (=> b!168032 (= res!139903 call!2829)))

(assert (=> b!168032 (=> (not res!139903) (not e!116623))))

(declare-fun b!168033 () Bool)

(assert (=> b!168033 (= e!116626 call!2829)))

(declare-fun b!168034 () Bool)

(declare-fun e!116627 () Bool)

(assert (=> b!168034 (= e!116622 e!116627)))

(declare-fun res!139906 () Bool)

(assert (=> b!168034 (=> (not res!139906) (not e!116627))))

(assert (=> b!168034 (= res!139906 e!116624)))

(declare-fun res!139907 () Bool)

(assert (=> b!168034 (=> res!139907 e!116624)))

(assert (=> b!168034 (= res!139907 (bvsge (_1!7916 lt!261473) (_2!7916 lt!261473)))))

(declare-fun lt!261474 () (_ BitVec 32))

(assert (=> b!168034 (= lt!261474 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261475 () (_ BitVec 32))

(assert (=> b!168034 (= lt!261475 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168034 (= lt!261473 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034)))))))

(declare-fun b!168035 () Bool)

(declare-fun res!139904 () Bool)

(assert (=> b!168035 (= res!139904 (= lt!261474 #b00000000000000000000000000000000))))

(declare-fun e!116625 () Bool)

(assert (=> b!168035 (=> res!139904 e!116625)))

(assert (=> b!168035 (= e!116623 e!116625)))

(declare-fun c!8676 () Bool)

(declare-fun bm!2826 () Bool)

(assert (=> bm!2826 (= call!2829 (byteRangesEq!0 (select (arr!4777 (buf!4308 (_1!7903 lt!261034))) (_3!599 lt!261473)) (select (arr!4777 (buf!4308 thiss!1577)) (_3!599 lt!261473)) lt!261475 (ite c!8676 lt!261474 #b00000000000000000000000000001000)))))

(declare-fun b!168036 () Bool)

(assert (=> b!168036 (= e!116625 (byteRangesEq!0 (select (arr!4777 (buf!4308 (_1!7903 lt!261034))) (_4!124 lt!261473)) (select (arr!4777 (buf!4308 thiss!1577)) (_4!124 lt!261473)) #b00000000000000000000000000000000 lt!261474))))

(declare-fun b!168037 () Bool)

(assert (=> b!168037 (= e!116627 e!116626)))

(assert (=> b!168037 (= c!8676 (= (_3!599 lt!261473) (_4!124 lt!261473)))))

(assert (= (and d!59063 (not res!139905)) b!168034))

(assert (= (and b!168034 (not res!139907)) b!168031))

(assert (= (and b!168034 res!139906) b!168037))

(assert (= (and b!168037 c!8676) b!168033))

(assert (= (and b!168037 (not c!8676)) b!168032))

(assert (= (and b!168032 res!139903) b!168035))

(assert (= (and b!168035 (not res!139904)) b!168036))

(assert (= (or b!168033 b!168032) bm!2826))

(declare-fun m!267513 () Bool)

(assert (=> b!168031 m!267513))

(assert (=> b!168034 m!267279))

(declare-fun m!267515 () Bool)

(assert (=> b!168034 m!267515))

(declare-fun m!267517 () Bool)

(assert (=> bm!2826 m!267517))

(declare-fun m!267519 () Bool)

(assert (=> bm!2826 m!267519))

(assert (=> bm!2826 m!267517))

(assert (=> bm!2826 m!267519))

(declare-fun m!267521 () Bool)

(assert (=> bm!2826 m!267521))

(declare-fun m!267523 () Bool)

(assert (=> b!168036 m!267523))

(declare-fun m!267525 () Bool)

(assert (=> b!168036 m!267525))

(assert (=> b!168036 m!267523))

(assert (=> b!168036 m!267525))

(declare-fun m!267527 () Bool)

(assert (=> b!168036 m!267527))

(assert (=> b!167909 d!59063))

(assert (=> b!167909 d!59059))

(declare-fun d!59065 () Bool)

(declare-fun res!139908 () Bool)

(declare-fun e!116628 () Bool)

(assert (=> d!59065 (=> res!139908 e!116628)))

(assert (=> d!59065 (= res!139908 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)))))

(assert (=> d!59065 (= (arrayRangesEq!685 (buf!4308 thiss!1577) lt!260787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)) e!116628)))

(declare-fun b!168038 () Bool)

(declare-fun e!116629 () Bool)

(assert (=> b!168038 (= e!116628 e!116629)))

(declare-fun res!139909 () Bool)

(assert (=> b!168038 (=> (not res!139909) (not e!116629))))

(assert (=> b!168038 (= res!139909 (= (select (arr!4777 (buf!4308 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4777 lt!260787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!168039 () Bool)

(assert (=> b!168039 (= e!116629 (arrayRangesEq!685 (buf!4308 thiss!1577) lt!260787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)))))

(assert (= (and d!59065 (not res!139908)) b!168038))

(assert (= (and b!168038 res!139909) b!168039))

(declare-fun m!267529 () Bool)

(assert (=> b!168038 m!267529))

(declare-fun m!267531 () Bool)

(assert (=> b!168038 m!267531))

(declare-fun m!267533 () Bool)

(assert (=> b!168039 m!267533))

(assert (=> b!167858 d!59065))

(declare-fun d!59067 () Bool)

(declare-fun res!139910 () Bool)

(declare-fun e!116630 () Bool)

(assert (=> d!59067 (=> res!139910 e!116630)))

(assert (=> d!59067 (= res!139910 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (=> d!59067 (= (arrayRangesEq!685 lt!260790 lt!260787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) e!116630)))

(declare-fun b!168040 () Bool)

(declare-fun e!116631 () Bool)

(assert (=> b!168040 (= e!116630 e!116631)))

(declare-fun res!139911 () Bool)

(assert (=> b!168040 (=> (not res!139911) (not e!116631))))

(assert (=> b!168040 (= res!139911 (= (select (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4777 lt!260787) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!168041 () Bool)

(assert (=> b!168041 (= e!116631 (arrayRangesEq!685 lt!260790 lt!260787 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (= (and d!59067 (not res!139910)) b!168040))

(assert (= (and b!168040 res!139911) b!168041))

(declare-fun m!267535 () Bool)

(assert (=> b!168040 m!267535))

(assert (=> b!168040 m!267531))

(declare-fun m!267537 () Bool)

(assert (=> b!168041 m!267537))

(assert (=> b!167882 d!59067))

(declare-fun d!59069 () Bool)

(assert (=> d!59069 (= (byteRangesEq!0 (select (arr!4777 (buf!4308 lt!260797)) (_3!599 lt!261341)) (select (arr!4777 (buf!4308 thiss!1577)) (_3!599 lt!261341)) lt!261343 (ite c!8663 lt!261342 #b00000000000000000000000000001000)) (or (= lt!261343 (ite c!8663 lt!261342 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 lt!260797)) (_3!599 lt!261341))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8663 lt!261342 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261343)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 thiss!1577)) (_3!599 lt!261341))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8663 lt!261342 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261343)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14634 () Bool)

(assert (= bs!14634 d!59069))

(declare-fun m!267539 () Bool)

(assert (=> bs!14634 m!267539))

(declare-fun m!267541 () Bool)

(assert (=> bs!14634 m!267541))

(assert (=> bm!2819 d!59069))

(assert (=> d!58937 d!58945))

(declare-fun d!59071 () Bool)

(assert (=> d!59071 (isPrefixOf!0 lt!261045 lt!261045)))

(assert (=> d!59071 true))

(declare-fun _$14!313 () Unit!11660)

(assert (=> d!59071 (= (choose!11 lt!261045) _$14!313)))

(declare-fun bs!14635 () Bool)

(assert (= bs!14635 d!59071))

(assert (=> bs!14635 m!266899))

(assert (=> d!58937 d!59071))

(declare-fun d!59073 () Bool)

(assert (=> d!59073 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))) (tuple4!249 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!167903 d!59073))

(declare-fun d!59075 () Bool)

(assert (=> d!59075 (= (byteRangesEq!0 (select (arr!4777 (buf!4308 lt!260797)) (_4!124 lt!261341)) (select (arr!4777 (buf!4308 thiss!1577)) (_4!124 lt!261341)) #b00000000000000000000000000000000 lt!261342) (or (= #b00000000000000000000000000000000 lt!261342) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 lt!260797)) (_4!124 lt!261341))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261342))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 thiss!1577)) (_4!124 lt!261341))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261342))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14636 () Bool)

(assert (= bs!14636 d!59075))

(declare-fun m!267543 () Bool)

(assert (=> bs!14636 m!267543))

(assert (=> bs!14636 m!266801))

(assert (=> b!167917 d!59075))

(assert (=> b!167859 d!59047))

(assert (=> b!167859 d!58957))

(declare-fun d!59077 () Bool)

(declare-fun lt!261477 () (_ BitVec 32))

(assert (=> d!59077 (= lt!261477 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261479 () (_ BitVec 32))

(assert (=> d!59077 (= lt!261479 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!116633 () Bool)

(assert (=> d!59077 e!116633))

(declare-fun res!139912 () Bool)

(assert (=> d!59077 (=> (not res!139912) (not e!116633))))

(assert (=> d!59077 (= res!139912 (moveBitIndexPrecond!0 (_1!7903 lt!260794) ((_ sign_extend 32) nBits!511)))))

(declare-fun Unit!11690 () Unit!11660)

(declare-fun Unit!11691 () Unit!11660)

(declare-fun Unit!11692 () Unit!11660)

(assert (=> d!59077 (= (moveBitIndex!0 (_1!7903 lt!260794) ((_ sign_extend 32) nBits!511)) (ite (bvslt (bvadd (currentBit!8148 (_1!7903 lt!260794)) lt!261477) #b00000000000000000000000000000000) (tuple2!14633 Unit!11690 (BitStream!6869 (buf!4308 (_1!7903 lt!260794)) (bvsub (bvadd (currentByte!8153 (_1!7903 lt!260794)) lt!261479) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261477 (currentBit!8148 (_1!7903 lt!260794))))) (ite (bvsge (bvadd (currentBit!8148 (_1!7903 lt!260794)) lt!261477) #b00000000000000000000000000001000) (tuple2!14633 Unit!11691 (BitStream!6869 (buf!4308 (_1!7903 lt!260794)) (bvadd (currentByte!8153 (_1!7903 lt!260794)) lt!261479 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8148 (_1!7903 lt!260794)) lt!261477) #b00000000000000000000000000001000))) (tuple2!14633 Unit!11692 (BitStream!6869 (buf!4308 (_1!7903 lt!260794)) (bvadd (currentByte!8153 (_1!7903 lt!260794)) lt!261479) (bvadd (currentBit!8148 (_1!7903 lt!260794)) lt!261477))))))))

(declare-fun b!168042 () Bool)

(declare-fun e!116632 () Bool)

(assert (=> b!168042 (= e!116633 e!116632)))

(declare-fun res!139913 () Bool)

(assert (=> b!168042 (=> (not res!139913) (not e!116632))))

(declare-fun lt!261476 () tuple2!14632)

(declare-fun lt!261480 () (_ BitVec 64))

(assert (=> b!168042 (= res!139913 (= (bvadd lt!261480 ((_ sign_extend 32) nBits!511)) (bitIndex!0 (size!3856 (buf!4308 (_2!7915 lt!261476))) (currentByte!8153 (_2!7915 lt!261476)) (currentBit!8148 (_2!7915 lt!261476)))))))

(assert (=> b!168042 (or (not (= (bvand lt!261480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!511) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261480 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261480 ((_ sign_extend 32) nBits!511)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!168042 (= lt!261480 (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!260794))) (currentByte!8153 (_1!7903 lt!260794)) (currentBit!8148 (_1!7903 lt!260794))))))

(declare-fun lt!261478 () (_ BitVec 32))

(declare-fun lt!261481 () (_ BitVec 32))

(declare-fun Unit!11693 () Unit!11660)

(declare-fun Unit!11694 () Unit!11660)

(declare-fun Unit!11695 () Unit!11660)

(assert (=> b!168042 (= lt!261476 (ite (bvslt (bvadd (currentBit!8148 (_1!7903 lt!260794)) lt!261481) #b00000000000000000000000000000000) (tuple2!14633 Unit!11693 (BitStream!6869 (buf!4308 (_1!7903 lt!260794)) (bvsub (bvadd (currentByte!8153 (_1!7903 lt!260794)) lt!261478) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261481 (currentBit!8148 (_1!7903 lt!260794))))) (ite (bvsge (bvadd (currentBit!8148 (_1!7903 lt!260794)) lt!261481) #b00000000000000000000000000001000) (tuple2!14633 Unit!11694 (BitStream!6869 (buf!4308 (_1!7903 lt!260794)) (bvadd (currentByte!8153 (_1!7903 lt!260794)) lt!261478 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8148 (_1!7903 lt!260794)) lt!261481) #b00000000000000000000000000001000))) (tuple2!14633 Unit!11695 (BitStream!6869 (buf!4308 (_1!7903 lt!260794)) (bvadd (currentByte!8153 (_1!7903 lt!260794)) lt!261478) (bvadd (currentBit!8148 (_1!7903 lt!260794)) lt!261481))))))))

(assert (=> b!168042 (= lt!261481 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168042 (= lt!261478 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!511) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!168043 () Bool)

(assert (=> b!168043 (= e!116632 (and (= (size!3856 (buf!4308 (_1!7903 lt!260794))) (size!3856 (buf!4308 (_2!7915 lt!261476)))) (= (buf!4308 (_1!7903 lt!260794)) (buf!4308 (_2!7915 lt!261476)))))))

(assert (= (and d!59077 res!139912) b!168042))

(assert (= (and b!168042 res!139913) b!168043))

(declare-fun m!267545 () Bool)

(assert (=> d!59077 m!267545))

(declare-fun m!267547 () Bool)

(assert (=> b!168042 m!267547))

(assert (=> b!168042 m!267365))

(assert (=> b!167925 d!59077))

(declare-fun d!59079 () Bool)

(assert (=> d!59079 (= (byteRangesEq!0 (select (arr!4777 (buf!4308 thiss!1577)) (_3!599 lt!261335)) (select (arr!4777 (buf!4308 lt!260797)) (_3!599 lt!261335)) lt!261337 (ite c!8662 lt!261336 #b00000000000000000000000000001000)) (or (= lt!261337 (ite c!8662 lt!261336 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 thiss!1577)) (_3!599 lt!261335))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8662 lt!261336 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261337)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 lt!260797)) (_3!599 lt!261335))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8662 lt!261336 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!261337)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14637 () Bool)

(assert (= bs!14637 d!59079))

(declare-fun m!267549 () Bool)

(assert (=> bs!14637 m!267549))

(declare-fun m!267551 () Bool)

(assert (=> bs!14637 m!267551))

(assert (=> bm!2818 d!59079))

(declare-fun d!59081 () Bool)

(assert (=> d!59081 (= (byteRangesEq!0 (select (arr!4777 (buf!4308 thiss!1577)) (_4!124 lt!261335)) (select (arr!4777 (buf!4308 lt!260797)) (_4!124 lt!261335)) #b00000000000000000000000000000000 lt!261336) (or (= #b00000000000000000000000000000000 lt!261336) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 thiss!1577)) (_4!124 lt!261335))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261336))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!4777 (buf!4308 lt!260797)) (_4!124 lt!261335))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!261336))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!14638 () Bool)

(assert (= bs!14638 d!59081))

(declare-fun m!267553 () Bool)

(assert (=> bs!14638 m!267553))

(assert (=> bs!14638 m!266801))

(assert (=> b!167905 d!59081))

(assert (=> b!167873 d!59041))

(assert (=> d!58969 d!58927))

(declare-fun d!59083 () Bool)

(declare-fun res!139916 () Bool)

(declare-fun e!116634 () Bool)

(assert (=> d!59083 (=> res!139916 e!116634)))

(assert (=> d!59083 (= res!139916 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034)))))))

(assert (=> d!59083 (= (arrayBitRangesEq!0 (buf!4308 (_2!7903 lt!261034)) (buf!4308 lt!260797) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034)))) e!116634)))

(declare-fun e!116636 () Bool)

(declare-fun b!168044 () Bool)

(declare-fun lt!261482 () tuple4!248)

(assert (=> b!168044 (= e!116636 (arrayRangesEq!685 (buf!4308 (_2!7903 lt!261034)) (buf!4308 lt!260797) (_1!7916 lt!261482) (_2!7916 lt!261482)))))

(declare-fun b!168045 () Bool)

(declare-fun e!116638 () Bool)

(declare-fun e!116635 () Bool)

(assert (=> b!168045 (= e!116638 e!116635)))

(declare-fun res!139914 () Bool)

(declare-fun call!2830 () Bool)

(assert (=> b!168045 (= res!139914 call!2830)))

(assert (=> b!168045 (=> (not res!139914) (not e!116635))))

(declare-fun b!168046 () Bool)

(assert (=> b!168046 (= e!116638 call!2830)))

(declare-fun b!168047 () Bool)

(declare-fun e!116639 () Bool)

(assert (=> b!168047 (= e!116634 e!116639)))

(declare-fun res!139917 () Bool)

(assert (=> b!168047 (=> (not res!139917) (not e!116639))))

(assert (=> b!168047 (= res!139917 e!116636)))

(declare-fun res!139918 () Bool)

(assert (=> b!168047 (=> res!139918 e!116636)))

(assert (=> b!168047 (= res!139918 (bvsge (_1!7916 lt!261482) (_2!7916 lt!261482)))))

(declare-fun lt!261483 () (_ BitVec 32))

(assert (=> b!168047 (= lt!261483 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261484 () (_ BitVec 32))

(assert (=> b!168047 (= lt!261484 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168047 (= lt!261482 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_2!7903 lt!261034))) (currentByte!8153 (_2!7903 lt!261034)) (currentBit!8148 (_2!7903 lt!261034)))))))

(declare-fun b!168048 () Bool)

(declare-fun res!139915 () Bool)

(assert (=> b!168048 (= res!139915 (= lt!261483 #b00000000000000000000000000000000))))

(declare-fun e!116637 () Bool)

(assert (=> b!168048 (=> res!139915 e!116637)))

(assert (=> b!168048 (= e!116635 e!116637)))

(declare-fun c!8677 () Bool)

(declare-fun bm!2827 () Bool)

(assert (=> bm!2827 (= call!2830 (byteRangesEq!0 (select (arr!4777 (buf!4308 (_2!7903 lt!261034))) (_3!599 lt!261482)) (select (arr!4777 (buf!4308 lt!260797)) (_3!599 lt!261482)) lt!261484 (ite c!8677 lt!261483 #b00000000000000000000000000001000)))))

(declare-fun b!168049 () Bool)

(assert (=> b!168049 (= e!116637 (byteRangesEq!0 (select (arr!4777 (buf!4308 (_2!7903 lt!261034))) (_4!124 lt!261482)) (select (arr!4777 (buf!4308 lt!260797)) (_4!124 lt!261482)) #b00000000000000000000000000000000 lt!261483))))

(declare-fun b!168050 () Bool)

(assert (=> b!168050 (= e!116639 e!116638)))

(assert (=> b!168050 (= c!8677 (= (_3!599 lt!261482) (_4!124 lt!261482)))))

(assert (= (and d!59083 (not res!139916)) b!168047))

(assert (= (and b!168047 (not res!139918)) b!168044))

(assert (= (and b!168047 res!139917) b!168050))

(assert (= (and b!168050 c!8677) b!168046))

(assert (= (and b!168050 (not c!8677)) b!168045))

(assert (= (and b!168045 res!139914) b!168048))

(assert (= (and b!168048 (not res!139915)) b!168049))

(assert (= (or b!168046 b!168045) bm!2827))

(declare-fun m!267555 () Bool)

(assert (=> b!168044 m!267555))

(assert (=> b!168047 m!267269))

(declare-fun m!267557 () Bool)

(assert (=> b!168047 m!267557))

(declare-fun m!267559 () Bool)

(assert (=> bm!2827 m!267559))

(declare-fun m!267561 () Bool)

(assert (=> bm!2827 m!267561))

(assert (=> bm!2827 m!267559))

(assert (=> bm!2827 m!267561))

(declare-fun m!267563 () Bool)

(assert (=> bm!2827 m!267563))

(declare-fun m!267565 () Bool)

(assert (=> b!168049 m!267565))

(declare-fun m!267567 () Bool)

(assert (=> b!168049 m!267567))

(assert (=> b!168049 m!267565))

(assert (=> b!168049 m!267567))

(declare-fun m!267569 () Bool)

(assert (=> b!168049 m!267569))

(assert (=> b!167861 d!59083))

(assert (=> b!167861 d!59047))

(declare-fun d!59085 () Bool)

(declare-fun e!116640 () Bool)

(assert (=> d!59085 e!116640))

(declare-fun res!139920 () Bool)

(assert (=> d!59085 (=> (not res!139920) (not e!116640))))

(declare-fun lt!261489 () (_ BitVec 64))

(declare-fun lt!261486 () (_ BitVec 64))

(declare-fun lt!261490 () (_ BitVec 64))

(assert (=> d!59085 (= res!139920 (= lt!261486 (bvsub lt!261490 lt!261489)))))

(assert (=> d!59085 (or (= (bvand lt!261490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261490 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261490 lt!261489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59085 (= lt!261489 (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 (_2!7909 lt!261359)))) ((_ sign_extend 32) (currentByte!8153 (_2!7909 lt!261359))) ((_ sign_extend 32) (currentBit!8148 (_2!7909 lt!261359)))))))

(declare-fun lt!261487 () (_ BitVec 64))

(declare-fun lt!261485 () (_ BitVec 64))

(assert (=> d!59085 (= lt!261490 (bvmul lt!261487 lt!261485))))

(assert (=> d!59085 (or (= lt!261487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261485 (bvsdiv (bvmul lt!261487 lt!261485) lt!261487)))))

(assert (=> d!59085 (= lt!261485 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59085 (= lt!261487 ((_ sign_extend 32) (size!3856 (buf!4308 (_2!7909 lt!261359)))))))

(assert (=> d!59085 (= lt!261486 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8153 (_2!7909 lt!261359))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8148 (_2!7909 lt!261359)))))))

(assert (=> d!59085 (invariant!0 (currentBit!8148 (_2!7909 lt!261359)) (currentByte!8153 (_2!7909 lt!261359)) (size!3856 (buf!4308 (_2!7909 lt!261359))))))

(assert (=> d!59085 (= (bitIndex!0 (size!3856 (buf!4308 (_2!7909 lt!261359))) (currentByte!8153 (_2!7909 lt!261359)) (currentBit!8148 (_2!7909 lt!261359))) lt!261486)))

(declare-fun b!168051 () Bool)

(declare-fun res!139919 () Bool)

(assert (=> b!168051 (=> (not res!139919) (not e!116640))))

(assert (=> b!168051 (= res!139919 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261486))))

(declare-fun b!168052 () Bool)

(declare-fun lt!261488 () (_ BitVec 64))

(assert (=> b!168052 (= e!116640 (bvsle lt!261486 (bvmul lt!261488 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168052 (or (= lt!261488 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261488 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261488)))))

(assert (=> b!168052 (= lt!261488 ((_ sign_extend 32) (size!3856 (buf!4308 (_2!7909 lt!261359)))))))

(assert (= (and d!59085 res!139920) b!168051))

(assert (= (and b!168051 res!139919) b!168052))

(declare-fun m!267571 () Bool)

(assert (=> d!59085 m!267571))

(declare-fun m!267573 () Bool)

(assert (=> d!59085 m!267573))

(assert (=> b!167927 d!59085))

(declare-fun d!59087 () Bool)

(declare-fun e!116641 () Bool)

(assert (=> d!59087 e!116641))

(declare-fun res!139922 () Bool)

(assert (=> d!59087 (=> (not res!139922) (not e!116641))))

(declare-fun lt!261495 () (_ BitVec 64))

(declare-fun lt!261496 () (_ BitVec 64))

(declare-fun lt!261492 () (_ BitVec 64))

(assert (=> d!59087 (= res!139922 (= lt!261492 (bvsub lt!261496 lt!261495)))))

(assert (=> d!59087 (or (= (bvand lt!261496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!261495 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!261496 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!261496 lt!261495) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59087 (= lt!261495 (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 (_1!7903 lt!260794)))) ((_ sign_extend 32) (currentByte!8153 (_1!7903 lt!260794))) ((_ sign_extend 32) (currentBit!8148 (_1!7903 lt!260794)))))))

(declare-fun lt!261493 () (_ BitVec 64))

(declare-fun lt!261491 () (_ BitVec 64))

(assert (=> d!59087 (= lt!261496 (bvmul lt!261493 lt!261491))))

(assert (=> d!59087 (or (= lt!261493 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!261491 (bvsdiv (bvmul lt!261493 lt!261491) lt!261493)))))

(assert (=> d!59087 (= lt!261491 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!59087 (= lt!261493 ((_ sign_extend 32) (size!3856 (buf!4308 (_1!7903 lt!260794)))))))

(assert (=> d!59087 (= lt!261492 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8153 (_1!7903 lt!260794))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8148 (_1!7903 lt!260794)))))))

(assert (=> d!59087 (invariant!0 (currentBit!8148 (_1!7903 lt!260794)) (currentByte!8153 (_1!7903 lt!260794)) (size!3856 (buf!4308 (_1!7903 lt!260794))))))

(assert (=> d!59087 (= (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!260794))) (currentByte!8153 (_1!7903 lt!260794)) (currentBit!8148 (_1!7903 lt!260794))) lt!261492)))

(declare-fun b!168053 () Bool)

(declare-fun res!139921 () Bool)

(assert (=> b!168053 (=> (not res!139921) (not e!116641))))

(assert (=> b!168053 (= res!139921 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!261492))))

(declare-fun b!168054 () Bool)

(declare-fun lt!261494 () (_ BitVec 64))

(assert (=> b!168054 (= e!116641 (bvsle lt!261492 (bvmul lt!261494 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168054 (or (= lt!261494 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!261494 #b0000000000000000000000000000000000000000000000000000000000001000) lt!261494)))))

(assert (=> b!168054 (= lt!261494 ((_ sign_extend 32) (size!3856 (buf!4308 (_1!7903 lt!260794)))))))

(assert (= (and d!59087 res!139922) b!168053))

(assert (= (and b!168053 res!139921) b!168054))

(declare-fun m!267575 () Bool)

(assert (=> d!59087 m!267575))

(declare-fun m!267577 () Bool)

(assert (=> d!59087 m!267577))

(assert (=> b!167927 d!59087))

(assert (=> d!58935 d!58943))

(declare-fun d!59089 () Bool)

(assert (=> d!59089 (isPrefixOf!0 thiss!1577 thiss!1577)))

(assert (=> d!59089 true))

(declare-fun _$14!314 () Unit!11660)

(assert (=> d!59089 (= (choose!11 thiss!1577) _$14!314)))

(declare-fun bs!14639 () Bool)

(assert (= bs!14639 d!59089))

(assert (=> bs!14639 m!266909))

(assert (=> d!58935 d!59089))

(declare-fun d!59091 () Bool)

(declare-fun res!139923 () Bool)

(declare-fun e!116642 () Bool)

(assert (=> d!59091 (=> res!139923 e!116642)))

(assert (=> d!59091 (= res!139923 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (=> d!59091 (= (arrayRangesEq!685 lt!260790 (array!8685 (store (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) (size!3856 lt!260790)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))) e!116642)))

(declare-fun b!168055 () Bool)

(declare-fun e!116643 () Bool)

(assert (=> b!168055 (= e!116642 e!116643)))

(declare-fun res!139924 () Bool)

(assert (=> b!168055 (=> (not res!139924) (not e!116643))))

(assert (=> b!168055 (= res!139924 (= (select (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!4777 (array!8685 (store (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) (size!3856 lt!260790))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!168056 () Bool)

(assert (=> b!168056 (= e!116643 (arrayRangesEq!685 lt!260790 (array!8685 (store (arr!4777 lt!260790) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577)) lt!260788) (size!3856 lt!260790)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 (currentByte!8153 thiss!1577))))))

(assert (= (and d!59091 (not res!139923)) b!168055))

(assert (= (and b!168055 res!139924) b!168056))

(assert (=> b!168055 m!267307))

(declare-fun m!267579 () Bool)

(assert (=> b!168055 m!267579))

(declare-fun m!267581 () Bool)

(assert (=> b!168056 m!267581))

(assert (=> b!167863 d!59091))

(assert (=> d!58979 d!58737))

(declare-fun d!59093 () Bool)

(declare-fun res!139925 () Bool)

(declare-fun e!116644 () Bool)

(assert (=> d!59093 (=> res!139925 e!116644)))

(assert (=> d!59093 (= res!139925 (= (_1!7916 lt!261341) (_2!7916 lt!261341)))))

(assert (=> d!59093 (= (arrayRangesEq!685 (buf!4308 lt!260797) (buf!4308 thiss!1577) (_1!7916 lt!261341) (_2!7916 lt!261341)) e!116644)))

(declare-fun b!168057 () Bool)

(declare-fun e!116645 () Bool)

(assert (=> b!168057 (= e!116644 e!116645)))

(declare-fun res!139926 () Bool)

(assert (=> b!168057 (=> (not res!139926) (not e!116645))))

(assert (=> b!168057 (= res!139926 (= (select (arr!4777 (buf!4308 lt!260797)) (_1!7916 lt!261341)) (select (arr!4777 (buf!4308 thiss!1577)) (_1!7916 lt!261341))))))

(declare-fun b!168058 () Bool)

(assert (=> b!168058 (= e!116645 (arrayRangesEq!685 (buf!4308 lt!260797) (buf!4308 thiss!1577) (bvadd (_1!7916 lt!261341) #b00000000000000000000000000000001) (_2!7916 lt!261341)))))

(assert (= (and d!59093 (not res!139925)) b!168057))

(assert (= (and b!168057 res!139926) b!168058))

(declare-fun m!267583 () Bool)

(assert (=> b!168057 m!267583))

(declare-fun m!267585 () Bool)

(assert (=> b!168057 m!267585))

(declare-fun m!267587 () Bool)

(assert (=> b!168058 m!267587))

(assert (=> b!167912 d!59093))

(assert (=> b!167876 d!59041))

(assert (=> b!167876 d!58957))

(declare-fun d!59095 () Bool)

(declare-fun res!139927 () Bool)

(declare-fun e!116646 () Bool)

(assert (=> d!59095 (=> res!139927 e!116646)))

(assert (=> d!59095 (= res!139927 (= (_1!7916 lt!261335) (_2!7916 lt!261335)))))

(assert (=> d!59095 (= (arrayRangesEq!685 (buf!4308 thiss!1577) (buf!4308 lt!260797) (_1!7916 lt!261335) (_2!7916 lt!261335)) e!116646)))

(declare-fun b!168059 () Bool)

(declare-fun e!116647 () Bool)

(assert (=> b!168059 (= e!116646 e!116647)))

(declare-fun res!139928 () Bool)

(assert (=> b!168059 (=> (not res!139928) (not e!116647))))

(assert (=> b!168059 (= res!139928 (= (select (arr!4777 (buf!4308 thiss!1577)) (_1!7916 lt!261335)) (select (arr!4777 (buf!4308 lt!260797)) (_1!7916 lt!261335))))))

(declare-fun b!168060 () Bool)

(assert (=> b!168060 (= e!116647 (arrayRangesEq!685 (buf!4308 thiss!1577) (buf!4308 lt!260797) (bvadd (_1!7916 lt!261335) #b00000000000000000000000000000001) (_2!7916 lt!261335)))))

(assert (= (and d!59095 (not res!139927)) b!168059))

(assert (= (and b!168059 res!139928) b!168060))

(declare-fun m!267589 () Bool)

(assert (=> b!168059 m!267589))

(declare-fun m!267591 () Bool)

(assert (=> b!168059 m!267591))

(declare-fun m!267593 () Bool)

(assert (=> b!168060 m!267593))

(assert (=> b!167900 d!59095))

(assert (=> b!167867 d!59059))

(assert (=> b!167867 d!59047))

(declare-fun d!59097 () Bool)

(declare-fun res!139929 () Bool)

(declare-fun e!116648 () Bool)

(assert (=> d!59097 (=> res!139929 e!116648)))

(assert (=> d!59097 (= res!139929 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)))))

(assert (=> d!59097 (= (arrayRangesEq!685 (buf!4308 thiss!1577) (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)) e!116648)))

(declare-fun b!168061 () Bool)

(declare-fun e!116649 () Bool)

(assert (=> b!168061 (= e!116648 e!116649)))

(declare-fun res!139930 () Bool)

(assert (=> b!168061 (=> (not res!139930) (not e!116649))))

(assert (=> b!168061 (= res!139930 (= (select (arr!4777 (buf!4308 thiss!1577)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (select (arr!4777 (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577)))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!168062 () Bool)

(assert (=> b!168062 (= e!116649 (arrayRangesEq!685 (buf!4308 thiss!1577) (array!8685 (store (arr!4777 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) lt!260795) (size!3856 (buf!4308 thiss!1577))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (currentByte!8153 thiss!1577)))))

(assert (= (and d!59097 (not res!139929)) b!168061))

(assert (= (and b!168061 res!139930) b!168062))

(assert (=> b!168061 m!267529))

(declare-fun m!267595 () Bool)

(assert (=> b!168061 m!267595))

(declare-fun m!267597 () Bool)

(assert (=> b!168062 m!267597))

(assert (=> b!167911 d!59097))

(declare-fun d!59099 () Bool)

(declare-fun res!139933 () Bool)

(declare-fun e!116650 () Bool)

(assert (=> d!59099 (=> res!139933 e!116650)))

(assert (=> d!59099 (= res!139933 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045))))))

(assert (=> d!59099 (= (arrayBitRangesEq!0 (buf!4308 lt!261045) (buf!4308 lt!260797) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045))) e!116650)))

(declare-fun b!168063 () Bool)

(declare-fun e!116652 () Bool)

(declare-fun lt!261497 () tuple4!248)

(assert (=> b!168063 (= e!116652 (arrayRangesEq!685 (buf!4308 lt!261045) (buf!4308 lt!260797) (_1!7916 lt!261497) (_2!7916 lt!261497)))))

(declare-fun b!168064 () Bool)

(declare-fun e!116654 () Bool)

(declare-fun e!116651 () Bool)

(assert (=> b!168064 (= e!116654 e!116651)))

(declare-fun res!139931 () Bool)

(declare-fun call!2831 () Bool)

(assert (=> b!168064 (= res!139931 call!2831)))

(assert (=> b!168064 (=> (not res!139931) (not e!116651))))

(declare-fun b!168065 () Bool)

(assert (=> b!168065 (= e!116654 call!2831)))

(declare-fun b!168066 () Bool)

(declare-fun e!116655 () Bool)

(assert (=> b!168066 (= e!116650 e!116655)))

(declare-fun res!139934 () Bool)

(assert (=> b!168066 (=> (not res!139934) (not e!116655))))

(assert (=> b!168066 (= res!139934 e!116652)))

(declare-fun res!139935 () Bool)

(assert (=> b!168066 (=> res!139935 e!116652)))

(assert (=> b!168066 (= res!139935 (bvsge (_1!7916 lt!261497) (_2!7916 lt!261497)))))

(declare-fun lt!261498 () (_ BitVec 32))

(assert (=> b!168066 (= lt!261498 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261499 () (_ BitVec 32))

(assert (=> b!168066 (= lt!261499 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168066 (= lt!261497 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045))))))

(declare-fun b!168067 () Bool)

(declare-fun res!139932 () Bool)

(assert (=> b!168067 (= res!139932 (= lt!261498 #b00000000000000000000000000000000))))

(declare-fun e!116653 () Bool)

(assert (=> b!168067 (=> res!139932 e!116653)))

(assert (=> b!168067 (= e!116651 e!116653)))

(declare-fun c!8678 () Bool)

(declare-fun bm!2828 () Bool)

(assert (=> bm!2828 (= call!2831 (byteRangesEq!0 (select (arr!4777 (buf!4308 lt!261045)) (_3!599 lt!261497)) (select (arr!4777 (buf!4308 lt!260797)) (_3!599 lt!261497)) lt!261499 (ite c!8678 lt!261498 #b00000000000000000000000000001000)))))

(declare-fun b!168068 () Bool)

(assert (=> b!168068 (= e!116653 (byteRangesEq!0 (select (arr!4777 (buf!4308 lt!261045)) (_4!124 lt!261497)) (select (arr!4777 (buf!4308 lt!260797)) (_4!124 lt!261497)) #b00000000000000000000000000000000 lt!261498))))

(declare-fun b!168069 () Bool)

(assert (=> b!168069 (= e!116655 e!116654)))

(assert (=> b!168069 (= c!8678 (= (_3!599 lt!261497) (_4!124 lt!261497)))))

(assert (= (and d!59099 (not res!139933)) b!168066))

(assert (= (and b!168066 (not res!139935)) b!168063))

(assert (= (and b!168066 res!139934) b!168069))

(assert (= (and b!168069 c!8678) b!168065))

(assert (= (and b!168069 (not c!8678)) b!168064))

(assert (= (and b!168064 res!139931) b!168067))

(assert (= (and b!168067 (not res!139932)) b!168068))

(assert (= (or b!168065 b!168064) bm!2828))

(declare-fun m!267599 () Bool)

(assert (=> b!168063 m!267599))

(assert (=> b!168066 m!267297))

(assert (=> b!168066 m!267473))

(declare-fun m!267601 () Bool)

(assert (=> bm!2828 m!267601))

(declare-fun m!267603 () Bool)

(assert (=> bm!2828 m!267603))

(assert (=> bm!2828 m!267601))

(assert (=> bm!2828 m!267603))

(declare-fun m!267605 () Bool)

(assert (=> bm!2828 m!267605))

(declare-fun m!267607 () Bool)

(assert (=> b!168068 m!267607))

(declare-fun m!267609 () Bool)

(assert (=> b!168068 m!267609))

(assert (=> b!168068 m!267607))

(assert (=> b!168068 m!267609))

(declare-fun m!267611 () Bool)

(assert (=> b!168068 m!267611))

(assert (=> b!167878 d!59099))

(assert (=> b!167878 d!59041))

(declare-fun d!59101 () Bool)

(assert (=> d!59101 (= (arrayBitIndices!0 lt!261040 lt!261037) (tuple4!249 ((_ extract 31 0) (bvadd (bvsdiv lt!261040 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem lt!261040 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!261037 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!261040 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!261037 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!167915 d!59101))

(declare-fun d!59103 () Bool)

(assert (=> d!59103 (= (remainingBits!0 ((_ sign_extend 32) (size!3856 (buf!4308 lt!260797))) ((_ sign_extend 32) (currentByte!8153 lt!260797)) ((_ sign_extend 32) (currentBit!8148 lt!260797))) (bvsub (bvmul ((_ sign_extend 32) (size!3856 (buf!4308 lt!260797))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!8153 lt!260797)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8148 lt!260797)))))))

(assert (=> d!58957 d!59103))

(declare-fun d!59105 () Bool)

(assert (=> d!59105 (= (invariant!0 (currentBit!8148 lt!260797) (currentByte!8153 lt!260797) (size!3856 (buf!4308 lt!260797))) (and (bvsge (currentBit!8148 lt!260797) #b00000000000000000000000000000000) (bvslt (currentBit!8148 lt!260797) #b00000000000000000000000000001000) (bvsge (currentByte!8153 lt!260797) #b00000000000000000000000000000000) (or (bvslt (currentByte!8153 lt!260797) (size!3856 (buf!4308 lt!260797))) (and (= (currentBit!8148 lt!260797) #b00000000000000000000000000000000) (= (currentByte!8153 lt!260797) (size!3856 (buf!4308 lt!260797)))))))))

(assert (=> d!58957 d!59105))

(assert (=> d!58941 d!58947))

(declare-fun d!59107 () Bool)

(assert (=> d!59107 (isPrefixOf!0 lt!261045 lt!260797)))

(assert (=> d!59107 true))

(declare-fun _$15!281 () Unit!11660)

(assert (=> d!59107 (= (choose!30 lt!261045 thiss!1577 lt!260797) _$15!281)))

(declare-fun bs!14640 () Bool)

(assert (= bs!14640 d!59107))

(assert (=> bs!14640 m!266895))

(assert (=> d!58941 d!59107))

(declare-fun d!59109 () Bool)

(declare-fun res!139936 () Bool)

(declare-fun e!116657 () Bool)

(assert (=> d!59109 (=> (not res!139936) (not e!116657))))

(assert (=> d!59109 (= res!139936 (= (size!3856 (buf!4308 lt!261045)) (size!3856 (buf!4308 thiss!1577))))))

(assert (=> d!59109 (= (isPrefixOf!0 lt!261045 thiss!1577) e!116657)))

(declare-fun b!168070 () Bool)

(declare-fun res!139938 () Bool)

(assert (=> b!168070 (=> (not res!139938) (not e!116657))))

(assert (=> b!168070 (= res!139938 (bvsle (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045)) (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))))))

(declare-fun b!168071 () Bool)

(declare-fun e!116656 () Bool)

(assert (=> b!168071 (= e!116657 e!116656)))

(declare-fun res!139937 () Bool)

(assert (=> b!168071 (=> res!139937 e!116656)))

(assert (=> b!168071 (= res!139937 (= (size!3856 (buf!4308 lt!261045)) #b00000000000000000000000000000000))))

(declare-fun b!168072 () Bool)

(assert (=> b!168072 (= e!116656 (arrayBitRangesEq!0 (buf!4308 lt!261045) (buf!4308 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 lt!261045)) (currentByte!8153 lt!261045) (currentBit!8148 lt!261045))))))

(assert (= (and d!59109 res!139936) b!168070))

(assert (= (and b!168070 res!139938) b!168071))

(assert (= (and b!168071 (not res!139937)) b!168072))

(assert (=> b!168070 m!267297))

(assert (=> b!168070 m!266673))

(assert (=> b!168072 m!267297))

(assert (=> b!168072 m!267297))

(declare-fun m!267613 () Bool)

(assert (=> b!168072 m!267613))

(assert (=> d!58941 d!59109))

(declare-fun d!59111 () Bool)

(declare-fun res!139941 () Bool)

(declare-fun e!116658 () Bool)

(assert (=> d!59111 (=> res!139941 e!116658)))

(assert (=> d!59111 (= res!139941 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034)))))))

(assert (=> d!59111 (= (arrayBitRangesEq!0 (buf!4308 (_1!7903 lt!261034)) (buf!4308 (_2!7903 lt!261034)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034)))) e!116658)))

(declare-fun b!168073 () Bool)

(declare-fun e!116660 () Bool)

(declare-fun lt!261500 () tuple4!248)

(assert (=> b!168073 (= e!116660 (arrayRangesEq!685 (buf!4308 (_1!7903 lt!261034)) (buf!4308 (_2!7903 lt!261034)) (_1!7916 lt!261500) (_2!7916 lt!261500)))))

(declare-fun b!168074 () Bool)

(declare-fun e!116662 () Bool)

(declare-fun e!116659 () Bool)

(assert (=> b!168074 (= e!116662 e!116659)))

(declare-fun res!139939 () Bool)

(declare-fun call!2832 () Bool)

(assert (=> b!168074 (= res!139939 call!2832)))

(assert (=> b!168074 (=> (not res!139939) (not e!116659))))

(declare-fun b!168075 () Bool)

(assert (=> b!168075 (= e!116662 call!2832)))

(declare-fun b!168076 () Bool)

(declare-fun e!116663 () Bool)

(assert (=> b!168076 (= e!116658 e!116663)))

(declare-fun res!139942 () Bool)

(assert (=> b!168076 (=> (not res!139942) (not e!116663))))

(assert (=> b!168076 (= res!139942 e!116660)))

(declare-fun res!139943 () Bool)

(assert (=> b!168076 (=> res!139943 e!116660)))

(assert (=> b!168076 (= res!139943 (bvsge (_1!7916 lt!261500) (_2!7916 lt!261500)))))

(declare-fun lt!261501 () (_ BitVec 32))

(assert (=> b!168076 (= lt!261501 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261502 () (_ BitVec 32))

(assert (=> b!168076 (= lt!261502 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168076 (= lt!261500 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 (_1!7903 lt!261034))) (currentByte!8153 (_1!7903 lt!261034)) (currentBit!8148 (_1!7903 lt!261034)))))))

(declare-fun b!168077 () Bool)

(declare-fun res!139940 () Bool)

(assert (=> b!168077 (= res!139940 (= lt!261501 #b00000000000000000000000000000000))))

(declare-fun e!116661 () Bool)

(assert (=> b!168077 (=> res!139940 e!116661)))

(assert (=> b!168077 (= e!116659 e!116661)))

(declare-fun bm!2829 () Bool)

(declare-fun c!8679 () Bool)

(assert (=> bm!2829 (= call!2832 (byteRangesEq!0 (select (arr!4777 (buf!4308 (_1!7903 lt!261034))) (_3!599 lt!261500)) (select (arr!4777 (buf!4308 (_2!7903 lt!261034))) (_3!599 lt!261500)) lt!261502 (ite c!8679 lt!261501 #b00000000000000000000000000001000)))))

(declare-fun b!168078 () Bool)

(assert (=> b!168078 (= e!116661 (byteRangesEq!0 (select (arr!4777 (buf!4308 (_1!7903 lt!261034))) (_4!124 lt!261500)) (select (arr!4777 (buf!4308 (_2!7903 lt!261034))) (_4!124 lt!261500)) #b00000000000000000000000000000000 lt!261501))))

(declare-fun b!168079 () Bool)

(assert (=> b!168079 (= e!116663 e!116662)))

(assert (=> b!168079 (= c!8679 (= (_3!599 lt!261500) (_4!124 lt!261500)))))

(assert (= (and d!59111 (not res!139941)) b!168076))

(assert (= (and b!168076 (not res!139943)) b!168073))

(assert (= (and b!168076 res!139942) b!168079))

(assert (= (and b!168079 c!8679) b!168075))

(assert (= (and b!168079 (not c!8679)) b!168074))

(assert (= (and b!168074 res!139939) b!168077))

(assert (= (and b!168077 (not res!139940)) b!168078))

(assert (= (or b!168075 b!168074) bm!2829))

(declare-fun m!267615 () Bool)

(assert (=> b!168073 m!267615))

(assert (=> b!168076 m!267279))

(assert (=> b!168076 m!267515))

(declare-fun m!267617 () Bool)

(assert (=> bm!2829 m!267617))

(declare-fun m!267619 () Bool)

(assert (=> bm!2829 m!267619))

(assert (=> bm!2829 m!267617))

(assert (=> bm!2829 m!267619))

(declare-fun m!267621 () Bool)

(assert (=> bm!2829 m!267621))

(declare-fun m!267623 () Bool)

(assert (=> b!168078 m!267623))

(declare-fun m!267625 () Bool)

(assert (=> b!168078 m!267625))

(assert (=> b!168078 m!267623))

(assert (=> b!168078 m!267625))

(declare-fun m!267627 () Bool)

(assert (=> b!168078 m!267627))

(assert (=> b!167869 d!59111))

(assert (=> b!167869 d!59059))

(assert (=> b!167870 d!58709))

(assert (=> d!58971 d!58715))

(declare-fun d!59113 () Bool)

(declare-fun res!139946 () Bool)

(declare-fun e!116664 () Bool)

(assert (=> d!59113 (=> res!139946 e!116664)))

(assert (=> d!59113 (= res!139946 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))))))

(assert (=> d!59113 (= (arrayBitRangesEq!0 (buf!4308 thiss!1577) (buf!4308 thiss!1577) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))) e!116664)))

(declare-fun b!168080 () Bool)

(declare-fun e!116666 () Bool)

(declare-fun lt!261503 () tuple4!248)

(assert (=> b!168080 (= e!116666 (arrayRangesEq!685 (buf!4308 thiss!1577) (buf!4308 thiss!1577) (_1!7916 lt!261503) (_2!7916 lt!261503)))))

(declare-fun b!168081 () Bool)

(declare-fun e!116668 () Bool)

(declare-fun e!116665 () Bool)

(assert (=> b!168081 (= e!116668 e!116665)))

(declare-fun res!139944 () Bool)

(declare-fun call!2833 () Bool)

(assert (=> b!168081 (= res!139944 call!2833)))

(assert (=> b!168081 (=> (not res!139944) (not e!116665))))

(declare-fun b!168082 () Bool)

(assert (=> b!168082 (= e!116668 call!2833)))

(declare-fun b!168083 () Bool)

(declare-fun e!116669 () Bool)

(assert (=> b!168083 (= e!116664 e!116669)))

(declare-fun res!139947 () Bool)

(assert (=> b!168083 (=> (not res!139947) (not e!116669))))

(assert (=> b!168083 (= res!139947 e!116666)))

(declare-fun res!139948 () Bool)

(assert (=> b!168083 (=> res!139948 e!116666)))

(assert (=> b!168083 (= res!139948 (bvsge (_1!7916 lt!261503) (_2!7916 lt!261503)))))

(declare-fun lt!261504 () (_ BitVec 32))

(assert (=> b!168083 (= lt!261504 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261505 () (_ BitVec 32))

(assert (=> b!168083 (= lt!261505 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168083 (= lt!261503 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!3856 (buf!4308 thiss!1577)) (currentByte!8153 thiss!1577) (currentBit!8148 thiss!1577))))))

(declare-fun b!168084 () Bool)

(declare-fun res!139945 () Bool)

(assert (=> b!168084 (= res!139945 (= lt!261504 #b00000000000000000000000000000000))))

(declare-fun e!116667 () Bool)

(assert (=> b!168084 (=> res!139945 e!116667)))

(assert (=> b!168084 (= e!116665 e!116667)))

(declare-fun bm!2830 () Bool)

(declare-fun c!8680 () Bool)

(assert (=> bm!2830 (= call!2833 (byteRangesEq!0 (select (arr!4777 (buf!4308 thiss!1577)) (_3!599 lt!261503)) (select (arr!4777 (buf!4308 thiss!1577)) (_3!599 lt!261503)) lt!261505 (ite c!8680 lt!261504 #b00000000000000000000000000001000)))))

(declare-fun b!168085 () Bool)

(assert (=> b!168085 (= e!116667 (byteRangesEq!0 (select (arr!4777 (buf!4308 thiss!1577)) (_4!124 lt!261503)) (select (arr!4777 (buf!4308 thiss!1577)) (_4!124 lt!261503)) #b00000000000000000000000000000000 lt!261504))))

(declare-fun b!168086 () Bool)

(assert (=> b!168086 (= e!116669 e!116668)))

(assert (=> b!168086 (= c!8680 (= (_3!599 lt!261503) (_4!124 lt!261503)))))

(assert (= (and d!59113 (not res!139946)) b!168083))

(assert (= (and b!168083 (not res!139948)) b!168080))

(assert (= (and b!168083 res!139947) b!168086))

(assert (= (and b!168086 c!8680) b!168082))

(assert (= (and b!168086 (not c!8680)) b!168081))

(assert (= (and b!168081 res!139944) b!168084))

(assert (= (and b!168084 (not res!139945)) b!168085))

(assert (= (or b!168082 b!168081) bm!2830))

(declare-fun m!267629 () Bool)

(assert (=> b!168080 m!267629))

(assert (=> b!168083 m!266673))

(assert (=> b!168083 m!267319))

(declare-fun m!267631 () Bool)

(assert (=> bm!2830 m!267631))

(assert (=> bm!2830 m!267631))

(assert (=> bm!2830 m!267631))

(assert (=> bm!2830 m!267631))

(declare-fun m!267633 () Bool)

(assert (=> bm!2830 m!267633))

(declare-fun m!267635 () Bool)

(assert (=> b!168085 m!267635))

(assert (=> b!168085 m!267635))

(assert (=> b!168085 m!267635))

(assert (=> b!168085 m!267635))

(declare-fun m!267637 () Bool)

(assert (=> b!168085 m!267637))

(assert (=> b!167872 d!59113))

(assert (=> b!167872 d!58709))

(push 1)

(assert (not b!168029))

(assert (not bm!2824))

(assert (not d!59085))

(assert (not b!168027))

(assert (not d!59045))

(assert (not bm!2827))

(assert (not d!59055))

(assert (not bm!2829))

(assert (not d!59041))

(assert (not d!59059))

(assert (not b!168056))

(assert (not b!168083))

(assert (not bm!2828))

(assert (not b!168076))

(assert (not d!59089))

(assert (not b!168016))

(assert (not b!168044))

(assert (not b!168073))

(assert (not b!168042))

(assert (not b!168085))

(assert (not bm!2826))

(assert (not b!168039))

(assert (not d!59047))

(assert (not bm!2830))

(assert (not b!168062))

(assert (not b!168068))

(assert (not b!168066))

(assert (not b!168021))

(assert (not b!167999))

(assert (not b!168031))

(assert (not b!168080))

(assert (not d!59107))

(assert (not b!168078))

(assert (not b!168002))

(assert (not d!59057))

(assert (not b!168063))

(assert (not bm!2825))

(assert (not b!168041))

(assert (not b!168058))

(assert (not b!168047))

(assert (not d!59087))

(assert (not b!168060))

(assert (not d!59071))

(assert (not b!168036))

(assert (not b!168024))

(assert (not d!59049))

(assert (not b!168004))

(assert (not b!168049))

(assert (not d!59077))

(assert (not b!168070))

(assert (not d!59043))

(assert (not b!168034))

(assert (not b!168072))

(check-sat)


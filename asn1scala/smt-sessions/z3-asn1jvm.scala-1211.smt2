; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34472 () Bool)

(assert start!34472)

(declare-fun b!163563 () Bool)

(declare-fun res!136294 () Bool)

(declare-fun e!112979 () Bool)

(assert (=> b!163563 (=> (not res!136294) (not e!112979))))

(declare-datatypes ((array!8144 0))(
  ( (array!8145 (arr!4568 (Array (_ BitVec 32) (_ BitVec 8))) (size!3647 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6450 0))(
  ( (BitStream!6451 (buf!4099 array!8144) (currentByte!7652 (_ BitVec 32)) (currentBit!7647 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6450)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!163563 (= res!136294 (validate_offset_bits!1 ((_ sign_extend 32) (size!3647 (buf!4099 thiss!1577))) ((_ sign_extend 32) (currentByte!7652 thiss!1577)) ((_ sign_extend 32) (currentBit!7647 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!163564 () Bool)

(declare-fun res!136295 () Bool)

(declare-fun e!112981 () Bool)

(assert (=> b!163564 (=> res!136295 e!112981)))

(declare-datatypes ((Unit!11350 0))(
  ( (Unit!11351) )
))
(declare-datatypes ((tuple2!14520 0))(
  ( (tuple2!14521 (_1!7851 Unit!11350) (_2!7851 BitStream!6450)) )
))
(declare-fun lt!256687 () tuple2!14520)

(declare-fun isPrefixOf!0 (BitStream!6450 BitStream!6450) Bool)

(assert (=> b!163564 (= res!136295 (not (isPrefixOf!0 thiss!1577 (_2!7851 lt!256687))))))

(declare-fun b!163566 () Bool)

(declare-fun res!136293 () Bool)

(assert (=> b!163566 (=> (not res!136293) (not e!112979))))

(assert (=> b!163566 (= res!136293 (bvsle (bvadd (currentBit!7647 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!163567 () Bool)

(assert (=> b!163567 (= e!112981 true)))

(declare-datatypes ((tuple2!14522 0))(
  ( (tuple2!14523 (_1!7852 BitStream!6450) (_2!7852 BitStream!6450)) )
))
(declare-fun lt!256692 () tuple2!14522)

(declare-fun reader!0 (BitStream!6450 BitStream!6450) tuple2!14522)

(assert (=> b!163567 (= lt!256692 (reader!0 thiss!1577 (_2!7851 lt!256687)))))

(declare-fun b!163568 () Bool)

(declare-fun e!112980 () Bool)

(declare-fun array_inv!3388 (array!8144) Bool)

(assert (=> b!163568 (= e!112980 (array_inv!3388 (buf!4099 thiss!1577)))))

(declare-fun b!163565 () Bool)

(declare-fun e!112977 () Bool)

(assert (=> b!163565 (= e!112979 (not e!112977))))

(declare-fun res!136292 () Bool)

(assert (=> b!163565 (=> res!136292 e!112977)))

(declare-fun lt!256688 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163565 (= res!136292 (not (byteRangesEq!0 (select (arr!4568 (buf!4099 thiss!1577)) (currentByte!7652 thiss!1577)) lt!256688 #b00000000000000000000000000000000 (currentBit!7647 thiss!1577))))))

(declare-fun lt!256691 () array!8144)

(declare-fun arrayRangesEq!581 (array!8144 array!8144 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!163565 (arrayRangesEq!581 (buf!4099 thiss!1577) lt!256691 #b00000000000000000000000000000000 (currentByte!7652 thiss!1577))))

(declare-fun lt!256689 () Unit!11350)

(declare-fun arrayUpdatedAtPrefixLemma!189 (array!8144 (_ BitVec 32) (_ BitVec 8)) Unit!11350)

(assert (=> b!163565 (= lt!256689 (arrayUpdatedAtPrefixLemma!189 (buf!4099 thiss!1577) (currentByte!7652 thiss!1577) lt!256688))))

(assert (=> b!163565 (= lt!256691 (array!8145 (store (arr!4568 (buf!4099 thiss!1577)) (currentByte!7652 thiss!1577) lt!256688) (size!3647 (buf!4099 thiss!1577))))))

(declare-fun lt!256690 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!163565 (= lt!256688 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4568 (buf!4099 thiss!1577)) (currentByte!7652 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7647 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!256690)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!256690))))))

(assert (=> b!163565 (= lt!256690 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7647 thiss!1577) nBits!511)))))

(declare-fun res!136290 () Bool)

(assert (=> start!34472 (=> (not res!136290) (not e!112979))))

(assert (=> start!34472 (= res!136290 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34472 e!112979))

(assert (=> start!34472 true))

(declare-fun inv!12 (BitStream!6450) Bool)

(assert (=> start!34472 (and (inv!12 thiss!1577) e!112980)))

(declare-fun b!163569 () Bool)

(declare-fun res!136291 () Bool)

(assert (=> b!163569 (=> res!136291 e!112981)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!163569 (= res!136291 (not (= (bitIndex!0 (size!3647 (buf!4099 (_2!7851 lt!256687))) (currentByte!7652 (_2!7851 lt!256687)) (currentBit!7647 (_2!7851 lt!256687))) (bvadd (bitIndex!0 (size!3647 (buf!4099 thiss!1577)) (currentByte!7652 thiss!1577) (currentBit!7647 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!163570 () Bool)

(assert (=> b!163570 (= e!112977 e!112981)))

(declare-fun res!136296 () Bool)

(assert (=> b!163570 (=> res!136296 e!112981)))

(assert (=> b!163570 (= res!136296 (not (= (size!3647 (buf!4099 thiss!1577)) (size!3647 (buf!4099 (_2!7851 lt!256687))))))))

(declare-fun moveBitIndex!0 (BitStream!6450 (_ BitVec 64)) tuple2!14520)

(assert (=> b!163570 (= lt!256687 (moveBitIndex!0 (BitStream!6451 lt!256691 (currentByte!7652 thiss!1577) (currentBit!7647 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!34472 res!136290) b!163563))

(assert (= (and b!163563 res!136294) b!163566))

(assert (= (and b!163566 res!136293) b!163565))

(assert (= (and b!163565 (not res!136292)) b!163570))

(assert (= (and b!163570 (not res!136296)) b!163569))

(assert (= (and b!163569 (not res!136291)) b!163564))

(assert (= (and b!163564 (not res!136295)) b!163567))

(assert (= start!34472 b!163568))

(declare-fun m!259625 () Bool)

(assert (=> b!163564 m!259625))

(declare-fun m!259627 () Bool)

(assert (=> start!34472 m!259627))

(declare-fun m!259629 () Bool)

(assert (=> b!163569 m!259629))

(declare-fun m!259631 () Bool)

(assert (=> b!163569 m!259631))

(declare-fun m!259633 () Bool)

(assert (=> b!163570 m!259633))

(declare-fun m!259635 () Bool)

(assert (=> b!163568 m!259635))

(declare-fun m!259637 () Bool)

(assert (=> b!163565 m!259637))

(declare-fun m!259639 () Bool)

(assert (=> b!163565 m!259639))

(declare-fun m!259641 () Bool)

(assert (=> b!163565 m!259641))

(declare-fun m!259643 () Bool)

(assert (=> b!163565 m!259643))

(declare-fun m!259645 () Bool)

(assert (=> b!163565 m!259645))

(declare-fun m!259647 () Bool)

(assert (=> b!163565 m!259647))

(assert (=> b!163565 m!259637))

(declare-fun m!259649 () Bool)

(assert (=> b!163565 m!259649))

(declare-fun m!259651 () Bool)

(assert (=> b!163565 m!259651))

(declare-fun m!259653 () Bool)

(assert (=> b!163563 m!259653))

(declare-fun m!259655 () Bool)

(assert (=> b!163567 m!259655))

(check-sat (not b!163563) (not b!163569) (not start!34472) (not b!163565) (not b!163568) (not b!163567) (not b!163564) (not b!163570))

; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36412 () Bool)

(assert start!36412)

(declare-fun b!167490 () Bool)

(declare-fun res!139454 () Bool)

(declare-fun e!116211 () Bool)

(assert (=> b!167490 (=> res!139454 e!116211)))

(declare-datatypes ((array!8682 0))(
  ( (array!8683 (arr!4776 (Array (_ BitVec 32) (_ BitVec 8))) (size!3855 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6866 0))(
  ( (BitStream!6867 (buf!4307 array!8682) (currentByte!8152 (_ BitVec 32)) (currentBit!8147 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6866)

(declare-fun lt!260758 () BitStream!6866)

(declare-fun isPrefixOf!0 (BitStream!6866 BitStream!6866) Bool)

(assert (=> b!167490 (= res!139454 (not (isPrefixOf!0 thiss!1577 lt!260758)))))

(declare-fun b!167491 () Bool)

(declare-fun e!116210 () Bool)

(declare-fun e!116208 () Bool)

(assert (=> b!167491 (= e!116210 (not e!116208))))

(declare-fun res!139452 () Bool)

(assert (=> b!167491 (=> res!139452 e!116208)))

(declare-fun lt!260750 () (_ BitVec 8))

(declare-fun lt!260747 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167491 (= res!139452 (not (byteRangesEq!0 (select (arr!4776 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577)) lt!260750 #b00000000000000000000000000000000 lt!260747)))))

(declare-fun lt!260753 () array!8682)

(declare-fun arrayRangesEq!684 (array!8682 array!8682 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167491 (arrayRangesEq!684 (buf!4307 thiss!1577) lt!260753 #b00000000000000000000000000000000 (currentByte!8152 thiss!1577))))

(declare-datatypes ((Unit!11658 0))(
  ( (Unit!11659) )
))
(declare-fun lt!260749 () Unit!11658)

(declare-fun lt!260754 () array!8682)

(declare-fun arrayRangesEqTransitive!186 (array!8682 array!8682 array!8682 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!11658)

(assert (=> b!167491 (= lt!260749 (arrayRangesEqTransitive!186 (buf!4307 thiss!1577) lt!260754 lt!260753 #b00000000000000000000000000000000 (currentByte!8152 thiss!1577) (bvadd #b00000000000000000000000000000001 (currentByte!8152 thiss!1577))))))

(assert (=> b!167491 (arrayRangesEq!684 lt!260754 lt!260753 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!8152 thiss!1577)))))

(declare-fun lt!260752 () (_ BitVec 8))

(declare-fun lt!260756 () Unit!11658)

(declare-fun arrayUpdatedAtPrefixLemma!292 (array!8682 (_ BitVec 32) (_ BitVec 8)) Unit!11658)

(assert (=> b!167491 (= lt!260756 (arrayUpdatedAtPrefixLemma!292 lt!260754 (bvadd #b00000000000000000000000000000001 (currentByte!8152 thiss!1577)) lt!260752))))

(assert (=> b!167491 (arrayRangesEq!684 (buf!4307 thiss!1577) (array!8683 (store (arr!4776 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577) lt!260750) (size!3855 (buf!4307 thiss!1577))) #b00000000000000000000000000000000 (currentByte!8152 thiss!1577))))

(declare-fun lt!260757 () Unit!11658)

(assert (=> b!167491 (= lt!260757 (arrayUpdatedAtPrefixLemma!292 (buf!4307 thiss!1577) (currentByte!8152 thiss!1577) lt!260750))))

(declare-fun lt!260751 () (_ BitVec 32))

(assert (=> b!167491 (= lt!260750 (select (store (store (arr!4776 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4776 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8147 thiss!1577)))))))) (bvlshr (bvand lt!260751 #b00000000000000000000000011111111) lt!260747)))) (bvadd #b00000000000000000000000000000001 (currentByte!8152 thiss!1577)) lt!260752) (currentByte!8152 thiss!1577)))))

(assert (=> b!167491 (= lt!260753 (array!8683 (store (store (arr!4776 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4776 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8147 thiss!1577)))))))) (bvlshr (bvand lt!260751 #b00000000000000000000000011111111) lt!260747)))) (bvadd #b00000000000000000000000000000001 (currentByte!8152 thiss!1577)) lt!260752) (size!3855 (buf!4307 thiss!1577))))))

(declare-fun lt!260755 () (_ BitVec 32))

(assert (=> b!167491 (= lt!260752 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (store (arr!4776 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4776 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8147 thiss!1577)))))))) (bvlshr (bvand lt!260751 #b00000000000000000000000011111111) lt!260747)))) (bvadd #b00000000000000000000000000000001 (currentByte!8152 thiss!1577)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!260755))) (bvshl lt!260751 lt!260755))))))

(assert (=> b!167491 (= lt!260755 (bvsub #b00000000000000000000000000001000 lt!260747))))

(assert (=> b!167491 (= lt!260754 (array!8683 (store (arr!4776 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4776 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!8147 thiss!1577)))))))) (bvlshr (bvand lt!260751 #b00000000000000000000000011111111) lt!260747)))) (size!3855 (buf!4307 thiss!1577))))))

(declare-fun v!206 () (_ BitVec 8))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> b!167491 (= lt!260751 ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))))))

(assert (=> b!167491 (= lt!260747 (bvsub (bvadd (currentBit!8147 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167492 () Bool)

(declare-fun res!139457 () Bool)

(assert (=> b!167492 (=> (not res!139457) (not e!116210))))

(assert (=> b!167492 (= res!139457 (bvsgt (bvadd (currentBit!8147 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!167493 () Bool)

(assert (=> b!167493 (= e!116208 e!116211)))

(declare-fun res!139455 () Bool)

(assert (=> b!167493 (=> res!139455 e!116211)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!167493 (= res!139455 (not (= (bitIndex!0 (size!3855 (buf!4307 thiss!1577)) (bvadd #b00000000000000000000000000000001 (currentByte!8152 thiss!1577)) lt!260747) (bvadd (bitIndex!0 (size!3855 (buf!4307 thiss!1577)) (currentByte!8152 thiss!1577) (currentBit!8147 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(assert (=> b!167493 (= lt!260758 (BitStream!6867 lt!260753 (bvadd #b00000000000000000000000000000001 (currentByte!8152 thiss!1577)) lt!260747))))

(declare-fun b!167494 () Bool)

(assert (=> b!167494 (= e!116211 (and (bvsge nBits!511 #b00000000000000000000000000000000) (bvslt nBits!511 #b00000000000000000000000000001001)))))

(declare-datatypes ((tuple2!14608 0))(
  ( (tuple2!14609 (_1!7901 BitStream!6866) (_2!7901 (_ BitVec 8))) )
))
(declare-fun lt!260748 () tuple2!14608)

(declare-fun readPartialBytePure!0 (BitStream!6866 (_ BitVec 32)) tuple2!14608)

(declare-datatypes ((tuple2!14610 0))(
  ( (tuple2!14611 (_1!7902 BitStream!6866) (_2!7902 BitStream!6866)) )
))
(declare-fun reader!0 (BitStream!6866 BitStream!6866) tuple2!14610)

(assert (=> b!167494 (= lt!260748 (readPartialBytePure!0 (_1!7902 (reader!0 thiss!1577 lt!260758)) nBits!511))))

(declare-fun b!167496 () Bool)

(declare-fun e!116207 () Bool)

(declare-fun array_inv!3596 (array!8682) Bool)

(assert (=> b!167496 (= e!116207 (array_inv!3596 (buf!4307 thiss!1577)))))

(declare-fun res!139456 () Bool)

(assert (=> start!36412 (=> (not res!139456) (not e!116210))))

(assert (=> start!36412 (= res!139456 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!36412 e!116210))

(assert (=> start!36412 true))

(declare-fun inv!12 (BitStream!6866) Bool)

(assert (=> start!36412 (and (inv!12 thiss!1577) e!116207)))

(declare-fun b!167495 () Bool)

(declare-fun res!139453 () Bool)

(assert (=> b!167495 (=> (not res!139453) (not e!116210))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!167495 (= res!139453 (validate_offset_bits!1 ((_ sign_extend 32) (size!3855 (buf!4307 thiss!1577))) ((_ sign_extend 32) (currentByte!8152 thiss!1577)) ((_ sign_extend 32) (currentBit!8147 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!36412 res!139456) b!167495))

(assert (= (and b!167495 res!139453) b!167492))

(assert (= (and b!167492 res!139457) b!167491))

(assert (= (and b!167491 (not res!139452)) b!167493))

(assert (= (and b!167493 (not res!139455)) b!167490))

(assert (= (and b!167490 (not res!139454)) b!167494))

(assert (= start!36412 b!167496))

(declare-fun m!266583 () Bool)

(assert (=> b!167493 m!266583))

(declare-fun m!266585 () Bool)

(assert (=> b!167493 m!266585))

(declare-fun m!266587 () Bool)

(assert (=> b!167491 m!266587))

(declare-fun m!266589 () Bool)

(assert (=> b!167491 m!266589))

(declare-fun m!266591 () Bool)

(assert (=> b!167491 m!266591))

(declare-fun m!266593 () Bool)

(assert (=> b!167491 m!266593))

(declare-fun m!266595 () Bool)

(assert (=> b!167491 m!266595))

(declare-fun m!266597 () Bool)

(assert (=> b!167491 m!266597))

(declare-fun m!266599 () Bool)

(assert (=> b!167491 m!266599))

(declare-fun m!266601 () Bool)

(assert (=> b!167491 m!266601))

(assert (=> b!167491 m!266589))

(declare-fun m!266603 () Bool)

(assert (=> b!167491 m!266603))

(declare-fun m!266605 () Bool)

(assert (=> b!167491 m!266605))

(declare-fun m!266607 () Bool)

(assert (=> b!167491 m!266607))

(declare-fun m!266609 () Bool)

(assert (=> b!167491 m!266609))

(declare-fun m!266611 () Bool)

(assert (=> b!167491 m!266611))

(declare-fun m!266613 () Bool)

(assert (=> b!167491 m!266613))

(declare-fun m!266615 () Bool)

(assert (=> b!167491 m!266615))

(declare-fun m!266617 () Bool)

(assert (=> b!167491 m!266617))

(declare-fun m!266619 () Bool)

(assert (=> start!36412 m!266619))

(declare-fun m!266621 () Bool)

(assert (=> b!167494 m!266621))

(declare-fun m!266623 () Bool)

(assert (=> b!167494 m!266623))

(declare-fun m!266625 () Bool)

(assert (=> b!167495 m!266625))

(declare-fun m!266627 () Bool)

(assert (=> b!167496 m!266627))

(declare-fun m!266629 () Bool)

(assert (=> b!167490 m!266629))

(push 1)


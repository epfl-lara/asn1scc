; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35376 () Bool)

(assert start!35376)

(declare-fun b!165485 () Bool)

(declare-fun e!114533 () Bool)

(declare-fun e!114536 () Bool)

(assert (=> b!165485 (= e!114533 e!114536)))

(declare-fun res!137835 () Bool)

(assert (=> b!165485 (=> res!137835 e!114536)))

(declare-datatypes ((array!8426 0))(
  ( (array!8427 (arr!4682 (Array (_ BitVec 32) (_ BitVec 8))) (size!3761 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6678 0))(
  ( (BitStream!6679 (buf!4213 array!8426) (currentByte!7895 (_ BitVec 32)) (currentBit!7890 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6678)

(declare-datatypes ((Unit!11512 0))(
  ( (Unit!11513) )
))
(declare-datatypes ((tuple2!14564 0))(
  ( (tuple2!14565 (_1!7873 Unit!11512) (_2!7873 BitStream!6678)) )
))
(declare-fun lt!258801 () tuple2!14564)

(assert (=> b!165485 (= res!137835 (not (= (size!3761 (buf!4213 thiss!1577)) (size!3761 (buf!4213 (_2!7873 lt!258801))))))))

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun lt!258796 () array!8426)

(declare-fun moveBitIndex!0 (BitStream!6678 (_ BitVec 64)) tuple2!14564)

(assert (=> b!165485 (= lt!258801 (moveBitIndex!0 (BitStream!6679 lt!258796 (currentByte!7895 thiss!1577) (currentBit!7890 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165486 () Bool)

(declare-fun res!137838 () Bool)

(assert (=> b!165486 (=> res!137838 e!114536)))

(declare-fun isPrefixOf!0 (BitStream!6678 BitStream!6678) Bool)

(assert (=> b!165486 (= res!137838 (not (isPrefixOf!0 thiss!1577 (_2!7873 lt!258801))))))

(declare-fun b!165487 () Bool)

(declare-fun res!137837 () Bool)

(declare-fun e!114535 () Bool)

(assert (=> b!165487 (=> (not res!137837) (not e!114535))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165487 (= res!137837 (validate_offset_bits!1 ((_ sign_extend 32) (size!3761 (buf!4213 thiss!1577))) ((_ sign_extend 32) (currentByte!7895 thiss!1577)) ((_ sign_extend 32) (currentBit!7890 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165488 () Bool)

(declare-fun e!114537 () Bool)

(declare-fun array_inv!3502 (array!8426) Bool)

(assert (=> b!165488 (= e!114537 (array_inv!3502 (buf!4213 thiss!1577)))))

(declare-fun b!165489 () Bool)

(declare-fun res!137839 () Bool)

(assert (=> b!165489 (=> (not res!137839) (not e!114535))))

(assert (=> b!165489 (= res!137839 (bvsle (bvadd (currentBit!7890 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!165490 () Bool)

(assert (=> b!165490 (= e!114535 (not e!114533))))

(declare-fun res!137836 () Bool)

(assert (=> b!165490 (=> res!137836 e!114533)))

(declare-fun lt!258797 () (_ BitVec 8))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165490 (= res!137836 (not (byteRangesEq!0 (select (arr!4682 (buf!4213 thiss!1577)) (currentByte!7895 thiss!1577)) lt!258797 #b00000000000000000000000000000000 (currentBit!7890 thiss!1577))))))

(declare-fun arrayRangesEq!641 (array!8426 array!8426 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!165490 (arrayRangesEq!641 (buf!4213 thiss!1577) lt!258796 #b00000000000000000000000000000000 (currentByte!7895 thiss!1577))))

(declare-fun lt!258799 () Unit!11512)

(declare-fun arrayUpdatedAtPrefixLemma!249 (array!8426 (_ BitVec 32) (_ BitVec 8)) Unit!11512)

(assert (=> b!165490 (= lt!258799 (arrayUpdatedAtPrefixLemma!249 (buf!4213 thiss!1577) (currentByte!7895 thiss!1577) lt!258797))))

(assert (=> b!165490 (= lt!258796 (array!8427 (store (arr!4682 (buf!4213 thiss!1577)) (currentByte!7895 thiss!1577) lt!258797) (size!3761 (buf!4213 thiss!1577))))))

(declare-fun lt!258798 () (_ BitVec 32))

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!165490 (= lt!258797 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4682 (buf!4213 thiss!1577)) (currentByte!7895 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7890 thiss!1577))))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) lt!258798)))))) (bvshl ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) lt!258798))))))

(assert (=> b!165490 (= lt!258798 (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7890 thiss!1577) nBits!511)))))

(declare-fun res!137834 () Bool)

(assert (=> start!35376 (=> (not res!137834) (not e!114535))))

(assert (=> start!35376 (= res!137834 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35376 e!114535))

(assert (=> start!35376 true))

(declare-fun inv!12 (BitStream!6678) Bool)

(assert (=> start!35376 (and (inv!12 thiss!1577) e!114537)))

(declare-fun b!165491 () Bool)

(declare-fun res!137840 () Bool)

(assert (=> b!165491 (=> res!137840 e!114536)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!165491 (= res!137840 (not (= (bitIndex!0 (size!3761 (buf!4213 (_2!7873 lt!258801))) (currentByte!7895 (_2!7873 lt!258801)) (currentBit!7890 (_2!7873 lt!258801))) (bvadd (bitIndex!0 (size!3761 (buf!4213 thiss!1577)) (currentByte!7895 thiss!1577) (currentBit!7890 thiss!1577)) ((_ sign_extend 32) nBits!511)))))))

(declare-fun b!165492 () Bool)

(assert (=> b!165492 (= e!114536 (and (bvsge nBits!511 #b00000000000000000000000000000000) (bvslt nBits!511 #b00000000000000000000000000001001)))))

(declare-datatypes ((tuple2!14566 0))(
  ( (tuple2!14567 (_1!7874 BitStream!6678) (_2!7874 (_ BitVec 8))) )
))
(declare-fun lt!258800 () tuple2!14566)

(declare-fun readPartialBytePure!0 (BitStream!6678 (_ BitVec 32)) tuple2!14566)

(declare-datatypes ((tuple2!14568 0))(
  ( (tuple2!14569 (_1!7875 BitStream!6678) (_2!7875 BitStream!6678)) )
))
(declare-fun reader!0 (BitStream!6678 BitStream!6678) tuple2!14568)

(assert (=> b!165492 (= lt!258800 (readPartialBytePure!0 (_1!7875 (reader!0 thiss!1577 (_2!7873 lt!258801))) nBits!511))))

(assert (= (and start!35376 res!137834) b!165487))

(assert (= (and b!165487 res!137837) b!165489))

(assert (= (and b!165489 res!137839) b!165490))

(assert (= (and b!165490 (not res!137836)) b!165485))

(assert (= (and b!165485 (not res!137835)) b!165491))

(assert (= (and b!165491 (not res!137840)) b!165486))

(assert (= (and b!165486 (not res!137838)) b!165492))

(assert (= start!35376 b!165488))

(declare-fun m!262967 () Bool)

(assert (=> b!165487 m!262967))

(declare-fun m!262969 () Bool)

(assert (=> b!165490 m!262969))

(declare-fun m!262971 () Bool)

(assert (=> b!165490 m!262971))

(declare-fun m!262973 () Bool)

(assert (=> b!165490 m!262973))

(declare-fun m!262975 () Bool)

(assert (=> b!165490 m!262975))

(declare-fun m!262977 () Bool)

(assert (=> b!165490 m!262977))

(declare-fun m!262979 () Bool)

(assert (=> b!165490 m!262979))

(declare-fun m!262981 () Bool)

(assert (=> b!165490 m!262981))

(declare-fun m!262983 () Bool)

(assert (=> b!165490 m!262983))

(assert (=> b!165490 m!262971))

(declare-fun m!262985 () Bool)

(assert (=> b!165492 m!262985))

(declare-fun m!262987 () Bool)

(assert (=> b!165492 m!262987))

(declare-fun m!262989 () Bool)

(assert (=> b!165486 m!262989))

(declare-fun m!262991 () Bool)

(assert (=> b!165488 m!262991))

(declare-fun m!262993 () Bool)

(assert (=> start!35376 m!262993))

(declare-fun m!262995 () Bool)

(assert (=> b!165491 m!262995))

(declare-fun m!262997 () Bool)

(assert (=> b!165491 m!262997))

(declare-fun m!262999 () Bool)

(assert (=> b!165485 m!262999))

(check-sat (not b!165491) (not start!35376) (not b!165485) (not b!165490) (not b!165487) (not b!165486) (not b!165492) (not b!165488))
(check-sat)

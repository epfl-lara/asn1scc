; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22452 () Bool)

(assert start!22452)

(declare-fun b!113534 () Bool)

(declare-fun e!74480 () Bool)

(declare-fun e!74483 () Bool)

(assert (=> b!113534 (= e!74480 e!74483)))

(declare-fun res!93768 () Bool)

(assert (=> b!113534 (=> (not res!93768) (not e!74483))))

(declare-fun lt!172574 () (_ BitVec 64))

(declare-fun lt!172578 () (_ BitVec 64))

(assert (=> b!113534 (= res!93768 (= lt!172574 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!172578)))))

(declare-datatypes ((array!5159 0))(
  ( (array!5160 (arr!2937 (Array (_ BitVec 32) (_ BitVec 8))) (size!2344 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4162 0))(
  ( (BitStream!4163 (buf!2752 array!5159) (currentByte!5338 (_ BitVec 32)) (currentBit!5333 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6973 0))(
  ( (Unit!6974) )
))
(declare-datatypes ((tuple2!9354 0))(
  ( (tuple2!9355 (_1!4939 Unit!6973) (_2!4939 BitStream!4162)) )
))
(declare-fun lt!172580 () tuple2!9354)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113534 (= lt!172574 (bitIndex!0 (size!2344 (buf!2752 (_2!4939 lt!172580))) (currentByte!5338 (_2!4939 lt!172580)) (currentBit!5333 (_2!4939 lt!172580))))))

(declare-fun thiss!1305 () BitStream!4162)

(assert (=> b!113534 (= lt!172578 (bitIndex!0 (size!2344 (buf!2752 thiss!1305)) (currentByte!5338 thiss!1305) (currentBit!5333 thiss!1305)))))

(declare-fun b!113535 () Bool)

(declare-fun res!93770 () Bool)

(assert (=> b!113535 (=> (not res!93770) (not e!74483))))

(declare-fun isPrefixOf!0 (BitStream!4162 BitStream!4162) Bool)

(assert (=> b!113535 (= res!93770 (isPrefixOf!0 thiss!1305 (_2!4939 lt!172580)))))

(declare-fun b!113536 () Bool)

(declare-fun res!93769 () Bool)

(declare-fun e!74482 () Bool)

(assert (=> b!113536 (=> (not res!93769) (not e!74482))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113536 (= res!93769 (validate_offset_bits!1 ((_ sign_extend 32) (size!2344 (buf!2752 thiss!1305))) ((_ sign_extend 32) (currentByte!5338 thiss!1305)) ((_ sign_extend 32) (currentBit!5333 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!93766 () Bool)

(assert (=> start!22452 (=> (not res!93766) (not e!74482))))

(assert (=> start!22452 (= res!93766 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22452 e!74482))

(assert (=> start!22452 true))

(declare-fun e!74479 () Bool)

(declare-fun inv!12 (BitStream!4162) Bool)

(assert (=> start!22452 (and (inv!12 thiss!1305) e!74479)))

(declare-fun b!113537 () Bool)

(declare-fun e!74481 () Bool)

(declare-datatypes ((tuple2!9356 0))(
  ( (tuple2!9357 (_1!4940 BitStream!4162) (_2!4940 Bool)) )
))
(declare-fun lt!172579 () tuple2!9356)

(assert (=> b!113537 (= e!74481 (= (bitIndex!0 (size!2344 (buf!2752 (_1!4940 lt!172579))) (currentByte!5338 (_1!4940 lt!172579)) (currentBit!5333 (_1!4940 lt!172579))) lt!172574))))

(declare-fun b!113538 () Bool)

(assert (=> b!113538 (= e!74483 e!74481)))

(declare-fun res!93771 () Bool)

(assert (=> b!113538 (=> (not res!93771) (not e!74481))))

(declare-fun lt!172575 () Bool)

(assert (=> b!113538 (= res!93771 (and (= (_2!4940 lt!172579) lt!172575) (= (_1!4940 lt!172579) (_2!4939 lt!172580))))))

(declare-fun readBitPure!0 (BitStream!4162) tuple2!9356)

(declare-fun readerFrom!0 (BitStream!4162 (_ BitVec 32) (_ BitVec 32)) BitStream!4162)

(assert (=> b!113538 (= lt!172579 (readBitPure!0 (readerFrom!0 (_2!4939 lt!172580) (currentBit!5333 thiss!1305) (currentByte!5338 thiss!1305))))))

(declare-fun b!113539 () Bool)

(declare-fun array_inv!2146 (array!5159) Bool)

(assert (=> b!113539 (= e!74479 (array_inv!2146 (buf!2752 thiss!1305)))))

(declare-fun b!113540 () Bool)

(declare-fun res!93767 () Bool)

(assert (=> b!113540 (=> (not res!93767) (not e!74482))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113540 (= res!93767 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113541 () Bool)

(assert (=> b!113541 (= e!74482 (not true))))

(declare-fun lt!172576 () tuple2!9354)

(assert (=> b!113541 (isPrefixOf!0 thiss!1305 (_2!4939 lt!172576))))

(declare-fun lt!172577 () Unit!6973)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4162 BitStream!4162 BitStream!4162) Unit!6973)

(assert (=> b!113541 (= lt!172577 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4939 lt!172580) (_2!4939 lt!172576)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4162 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9354)

(assert (=> b!113541 (= lt!172576 (appendNLeastSignificantBitsLoop!0 (_2!4939 lt!172580) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!113541 e!74480))

(declare-fun res!93773 () Bool)

(assert (=> b!113541 (=> (not res!93773) (not e!74480))))

(assert (=> b!113541 (= res!93773 (= (size!2344 (buf!2752 thiss!1305)) (size!2344 (buf!2752 (_2!4939 lt!172580)))))))

(declare-fun appendBit!0 (BitStream!4162 Bool) tuple2!9354)

(assert (=> b!113541 (= lt!172580 (appendBit!0 thiss!1305 lt!172575))))

(assert (=> b!113541 (= lt!172575 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113542 () Bool)

(declare-fun res!93772 () Bool)

(assert (=> b!113542 (=> (not res!93772) (not e!74482))))

(assert (=> b!113542 (= res!93772 (bvslt i!615 nBits!396))))

(assert (= (and start!22452 res!93766) b!113536))

(assert (= (and b!113536 res!93769) b!113540))

(assert (= (and b!113540 res!93767) b!113542))

(assert (= (and b!113542 res!93772) b!113541))

(assert (= (and b!113541 res!93773) b!113534))

(assert (= (and b!113534 res!93768) b!113535))

(assert (= (and b!113535 res!93770) b!113538))

(assert (= (and b!113538 res!93771) b!113537))

(assert (= start!22452 b!113539))

(declare-fun m!169663 () Bool)

(assert (=> b!113538 m!169663))

(assert (=> b!113538 m!169663))

(declare-fun m!169665 () Bool)

(assert (=> b!113538 m!169665))

(declare-fun m!169667 () Bool)

(assert (=> b!113541 m!169667))

(declare-fun m!169669 () Bool)

(assert (=> b!113541 m!169669))

(declare-fun m!169671 () Bool)

(assert (=> b!113541 m!169671))

(declare-fun m!169673 () Bool)

(assert (=> b!113541 m!169673))

(declare-fun m!169675 () Bool)

(assert (=> b!113534 m!169675))

(declare-fun m!169677 () Bool)

(assert (=> b!113534 m!169677))

(declare-fun m!169679 () Bool)

(assert (=> b!113539 m!169679))

(declare-fun m!169681 () Bool)

(assert (=> b!113537 m!169681))

(declare-fun m!169683 () Bool)

(assert (=> b!113536 m!169683))

(declare-fun m!169685 () Bool)

(assert (=> b!113535 m!169685))

(declare-fun m!169687 () Bool)

(assert (=> b!113540 m!169687))

(declare-fun m!169689 () Bool)

(assert (=> start!22452 m!169689))

(push 1)

(assert (not start!22452))

(assert (not b!113540))

(assert (not b!113536))

(assert (not b!113537))

(assert (not b!113541))

(assert (not b!113535))

(assert (not b!113539))

(assert (not b!113534))

(assert (not b!113538))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


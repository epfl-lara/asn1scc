; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23212 () Bool)

(assert start!23212)

(declare-fun b!117731 () Bool)

(declare-fun res!97394 () Bool)

(declare-fun e!77161 () Bool)

(assert (=> b!117731 (=> (not res!97394) (not e!77161))))

(declare-datatypes ((array!5290 0))(
  ( (array!5291 (arr!2992 (Array (_ BitVec 32) (_ BitVec 8))) (size!2399 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4272 0))(
  ( (BitStream!4273 (buf!2815 array!5290) (currentByte!5464 (_ BitVec 32)) (currentBit!5459 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4272)

(declare-datatypes ((Unit!7245 0))(
  ( (Unit!7246) )
))
(declare-datatypes ((tuple2!9816 0))(
  ( (tuple2!9817 (_1!5173 Unit!7245) (_2!5173 BitStream!4272)) )
))
(declare-fun lt!180637 () tuple2!9816)

(declare-fun isPrefixOf!0 (BitStream!4272 BitStream!4272) Bool)

(assert (=> b!117731 (= res!97394 (isPrefixOf!0 thiss!1305 (_2!5173 lt!180637)))))

(declare-fun b!117733 () Bool)

(declare-fun e!77156 () Bool)

(declare-fun array_inv!2201 (array!5290) Bool)

(assert (=> b!117733 (= e!77156 (array_inv!2201 (buf!2815 thiss!1305)))))

(declare-fun b!117734 () Bool)

(declare-fun res!97390 () Bool)

(declare-fun e!77160 () Bool)

(assert (=> b!117734 (=> (not res!97390) (not e!77160))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117734 (= res!97390 (invariant!0 (currentBit!5459 thiss!1305) (currentByte!5464 thiss!1305) (size!2399 (buf!2815 (_2!5173 lt!180637)))))))

(declare-fun b!117735 () Bool)

(declare-fun res!97388 () Bool)

(declare-fun e!77159 () Bool)

(assert (=> b!117735 (=> (not res!97388) (not e!77159))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!117735 (= res!97388 (bvslt i!615 nBits!396))))

(declare-fun b!117736 () Bool)

(declare-fun e!77163 () Bool)

(declare-datatypes ((tuple2!9818 0))(
  ( (tuple2!9819 (_1!5174 BitStream!4272) (_2!5174 Bool)) )
))
(declare-fun lt!180644 () tuple2!9818)

(declare-fun lt!180639 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117736 (= e!77163 (= (bitIndex!0 (size!2399 (buf!2815 (_1!5174 lt!180644))) (currentByte!5464 (_1!5174 lt!180644)) (currentBit!5459 (_1!5174 lt!180644))) lt!180639))))

(declare-fun b!117737 () Bool)

(declare-fun e!77157 () Bool)

(assert (=> b!117737 (= e!77157 e!77159)))

(declare-fun res!97393 () Bool)

(assert (=> b!117737 (=> (not res!97393) (not e!77159))))

(declare-fun lt!180638 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117737 (= res!97393 (validate_offset_bits!1 ((_ sign_extend 32) (size!2399 (buf!2815 thiss!1305))) ((_ sign_extend 32) (currentByte!5464 thiss!1305)) ((_ sign_extend 32) (currentBit!5459 thiss!1305)) lt!180638))))

(assert (=> b!117737 (= lt!180638 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!117738 () Bool)

(declare-fun lt!180634 () tuple2!9816)

(assert (=> b!117738 (= e!77160 (invariant!0 (currentBit!5459 thiss!1305) (currentByte!5464 thiss!1305) (size!2399 (buf!2815 (_2!5173 lt!180634)))))))

(declare-fun res!97398 () Bool)

(assert (=> start!23212 (=> (not res!97398) (not e!77157))))

(assert (=> start!23212 (= res!97398 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23212 e!77157))

(assert (=> start!23212 true))

(declare-fun inv!12 (BitStream!4272) Bool)

(assert (=> start!23212 (and (inv!12 thiss!1305) e!77156)))

(declare-fun b!117732 () Bool)

(declare-fun res!97395 () Bool)

(assert (=> b!117732 (=> (not res!97395) (not e!77159))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117732 (= res!97395 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117739 () Bool)

(assert (=> b!117739 (= e!77161 e!77163)))

(declare-fun res!97391 () Bool)

(assert (=> b!117739 (=> (not res!97391) (not e!77163))))

(declare-fun lt!180641 () Bool)

(assert (=> b!117739 (= res!97391 (and (= (_2!5174 lt!180644) lt!180641) (= (_1!5174 lt!180644) (_2!5173 lt!180637))))))

(declare-fun readBitPure!0 (BitStream!4272) tuple2!9818)

(declare-fun readerFrom!0 (BitStream!4272 (_ BitVec 32) (_ BitVec 32)) BitStream!4272)

(assert (=> b!117739 (= lt!180644 (readBitPure!0 (readerFrom!0 (_2!5173 lt!180637) (currentBit!5459 thiss!1305) (currentByte!5464 thiss!1305))))))

(declare-fun b!117740 () Bool)

(declare-fun e!77158 () Bool)

(assert (=> b!117740 (= e!77158 e!77161)))

(declare-fun res!97392 () Bool)

(assert (=> b!117740 (=> (not res!97392) (not e!77161))))

(declare-fun lt!180646 () (_ BitVec 64))

(assert (=> b!117740 (= res!97392 (= lt!180639 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!180646)))))

(assert (=> b!117740 (= lt!180639 (bitIndex!0 (size!2399 (buf!2815 (_2!5173 lt!180637))) (currentByte!5464 (_2!5173 lt!180637)) (currentBit!5459 (_2!5173 lt!180637))))))

(assert (=> b!117740 (= lt!180646 (bitIndex!0 (size!2399 (buf!2815 thiss!1305)) (currentByte!5464 thiss!1305) (currentBit!5459 thiss!1305)))))

(declare-fun b!117741 () Bool)

(assert (=> b!117741 (= e!77159 (not (or (not (= (bvand i!615 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!615 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)))))))

(declare-fun lt!180643 () (_ BitVec 64))

(assert (=> b!117741 (validate_offset_bits!1 ((_ sign_extend 32) (size!2399 (buf!2815 (_2!5173 lt!180634)))) ((_ sign_extend 32) (currentByte!5464 (_2!5173 lt!180637))) ((_ sign_extend 32) (currentBit!5459 (_2!5173 lt!180637))) lt!180643)))

(declare-fun lt!180635 () Unit!7245)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4272 array!5290 (_ BitVec 64)) Unit!7245)

(assert (=> b!117741 (= lt!180635 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5173 lt!180637) (buf!2815 (_2!5173 lt!180634)) lt!180643))))

(assert (=> b!117741 (= lt!180643 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!9820 0))(
  ( (tuple2!9821 (_1!5175 BitStream!4272) (_2!5175 (_ BitVec 64))) )
))
(declare-fun lt!180651 () tuple2!9820)

(declare-datatypes ((tuple2!9822 0))(
  ( (tuple2!9823 (_1!5176 BitStream!4272) (_2!5176 BitStream!4272)) )
))
(declare-fun lt!180648 () tuple2!9822)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4272 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9820)

(assert (=> b!117741 (= lt!180651 (readNLeastSignificantBitsLoopPure!0 (_1!5176 lt!180648) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!117741 (validate_offset_bits!1 ((_ sign_extend 32) (size!2399 (buf!2815 (_2!5173 lt!180634)))) ((_ sign_extend 32) (currentByte!5464 thiss!1305)) ((_ sign_extend 32) (currentBit!5459 thiss!1305)) lt!180638)))

(declare-fun lt!180647 () Unit!7245)

(assert (=> b!117741 (= lt!180647 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2815 (_2!5173 lt!180634)) lt!180638))))

(assert (=> b!117741 (= (_2!5174 (readBitPure!0 (_1!5176 lt!180648))) lt!180641)))

(declare-fun lt!180640 () tuple2!9822)

(declare-fun reader!0 (BitStream!4272 BitStream!4272) tuple2!9822)

(assert (=> b!117741 (= lt!180640 (reader!0 (_2!5173 lt!180637) (_2!5173 lt!180634)))))

(assert (=> b!117741 (= lt!180648 (reader!0 thiss!1305 (_2!5173 lt!180634)))))

(declare-fun e!77162 () Bool)

(assert (=> b!117741 e!77162))

(declare-fun res!97389 () Bool)

(assert (=> b!117741 (=> (not res!97389) (not e!77162))))

(declare-fun lt!180642 () tuple2!9818)

(declare-fun lt!180650 () tuple2!9818)

(assert (=> b!117741 (= res!97389 (= (bitIndex!0 (size!2399 (buf!2815 (_1!5174 lt!180642))) (currentByte!5464 (_1!5174 lt!180642)) (currentBit!5459 (_1!5174 lt!180642))) (bitIndex!0 (size!2399 (buf!2815 (_1!5174 lt!180650))) (currentByte!5464 (_1!5174 lt!180650)) (currentBit!5459 (_1!5174 lt!180650)))))))

(declare-fun lt!180645 () Unit!7245)

(declare-fun lt!180636 () BitStream!4272)

(declare-fun readBitPrefixLemma!0 (BitStream!4272 BitStream!4272) Unit!7245)

(assert (=> b!117741 (= lt!180645 (readBitPrefixLemma!0 lt!180636 (_2!5173 lt!180634)))))

(assert (=> b!117741 (= lt!180650 (readBitPure!0 (BitStream!4273 (buf!2815 (_2!5173 lt!180634)) (currentByte!5464 thiss!1305) (currentBit!5459 thiss!1305))))))

(assert (=> b!117741 (= lt!180642 (readBitPure!0 lt!180636))))

(assert (=> b!117741 (= lt!180636 (BitStream!4273 (buf!2815 (_2!5173 lt!180637)) (currentByte!5464 thiss!1305) (currentBit!5459 thiss!1305)))))

(assert (=> b!117741 e!77160))

(declare-fun res!97396 () Bool)

(assert (=> b!117741 (=> (not res!97396) (not e!77160))))

(assert (=> b!117741 (= res!97396 (isPrefixOf!0 thiss!1305 (_2!5173 lt!180634)))))

(declare-fun lt!180649 () Unit!7245)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4272 BitStream!4272 BitStream!4272) Unit!7245)

(assert (=> b!117741 (= lt!180649 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5173 lt!180637) (_2!5173 lt!180634)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4272 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9816)

(assert (=> b!117741 (= lt!180634 (appendNLeastSignificantBitsLoop!0 (_2!5173 lt!180637) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!117741 e!77158))

(declare-fun res!97397 () Bool)

(assert (=> b!117741 (=> (not res!97397) (not e!77158))))

(assert (=> b!117741 (= res!97397 (= (size!2399 (buf!2815 thiss!1305)) (size!2399 (buf!2815 (_2!5173 lt!180637)))))))

(declare-fun appendBit!0 (BitStream!4272 Bool) tuple2!9816)

(assert (=> b!117741 (= lt!180637 (appendBit!0 thiss!1305 lt!180641))))

(assert (=> b!117741 (= lt!180641 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!117742 () Bool)

(assert (=> b!117742 (= e!77162 (= (_2!5174 lt!180642) (_2!5174 lt!180650)))))

(assert (= (and start!23212 res!97398) b!117737))

(assert (= (and b!117737 res!97393) b!117732))

(assert (= (and b!117732 res!97395) b!117735))

(assert (= (and b!117735 res!97388) b!117741))

(assert (= (and b!117741 res!97397) b!117740))

(assert (= (and b!117740 res!97392) b!117731))

(assert (= (and b!117731 res!97394) b!117739))

(assert (= (and b!117739 res!97391) b!117736))

(assert (= (and b!117741 res!97396) b!117734))

(assert (= (and b!117734 res!97390) b!117738))

(assert (= (and b!117741 res!97389) b!117742))

(assert (= start!23212 b!117733))

(declare-fun m!176633 () Bool)

(assert (=> start!23212 m!176633))

(declare-fun m!176635 () Bool)

(assert (=> b!117732 m!176635))

(declare-fun m!176637 () Bool)

(assert (=> b!117738 m!176637))

(declare-fun m!176639 () Bool)

(assert (=> b!117734 m!176639))

(declare-fun m!176641 () Bool)

(assert (=> b!117741 m!176641))

(declare-fun m!176643 () Bool)

(assert (=> b!117741 m!176643))

(declare-fun m!176645 () Bool)

(assert (=> b!117741 m!176645))

(declare-fun m!176647 () Bool)

(assert (=> b!117741 m!176647))

(declare-fun m!176649 () Bool)

(assert (=> b!117741 m!176649))

(declare-fun m!176651 () Bool)

(assert (=> b!117741 m!176651))

(declare-fun m!176653 () Bool)

(assert (=> b!117741 m!176653))

(declare-fun m!176655 () Bool)

(assert (=> b!117741 m!176655))

(declare-fun m!176657 () Bool)

(assert (=> b!117741 m!176657))

(declare-fun m!176659 () Bool)

(assert (=> b!117741 m!176659))

(declare-fun m!176661 () Bool)

(assert (=> b!117741 m!176661))

(declare-fun m!176663 () Bool)

(assert (=> b!117741 m!176663))

(declare-fun m!176665 () Bool)

(assert (=> b!117741 m!176665))

(declare-fun m!176667 () Bool)

(assert (=> b!117741 m!176667))

(declare-fun m!176669 () Bool)

(assert (=> b!117741 m!176669))

(declare-fun m!176671 () Bool)

(assert (=> b!117741 m!176671))

(declare-fun m!176673 () Bool)

(assert (=> b!117741 m!176673))

(declare-fun m!176675 () Bool)

(assert (=> b!117741 m!176675))

(declare-fun m!176677 () Bool)

(assert (=> b!117737 m!176677))

(declare-fun m!176679 () Bool)

(assert (=> b!117731 m!176679))

(declare-fun m!176681 () Bool)

(assert (=> b!117736 m!176681))

(declare-fun m!176683 () Bool)

(assert (=> b!117739 m!176683))

(assert (=> b!117739 m!176683))

(declare-fun m!176685 () Bool)

(assert (=> b!117739 m!176685))

(declare-fun m!176687 () Bool)

(assert (=> b!117733 m!176687))

(declare-fun m!176689 () Bool)

(assert (=> b!117740 m!176689))

(declare-fun m!176691 () Bool)

(assert (=> b!117740 m!176691))

(check-sat (not b!117731) (not b!117733) (not b!117739) (not start!23212) (not b!117738) (not b!117732) (not b!117740) (not b!117741) (not b!117737) (not b!117734) (not b!117736))
(check-sat)

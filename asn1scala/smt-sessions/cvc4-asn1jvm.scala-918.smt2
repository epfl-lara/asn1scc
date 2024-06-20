; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25802 () Bool)

(assert start!25802)

(declare-fun b!131628 () Bool)

(declare-fun res!109212 () Bool)

(declare-fun e!87248 () Bool)

(assert (=> b!131628 (=> (not res!109212) (not e!87248))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!131628 (= res!109212 (bvslt from!447 to!404))))

(declare-fun b!131629 () Bool)

(declare-fun e!87254 () Bool)

(declare-datatypes ((array!6077 0))(
  ( (array!6078 (arr!3380 (Array (_ BitVec 32) (_ BitVec 8))) (size!2751 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4766 0))(
  ( (BitStream!4767 (buf!3118 array!6077) (currentByte!5897 (_ BitVec 32)) (currentBit!5892 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4766)

(declare-fun array_inv!2540 (array!6077) Bool)

(assert (=> b!131629 (= e!87254 (array_inv!2540 (buf!3118 thiss!1634)))))

(declare-fun b!131630 () Bool)

(declare-fun e!87252 () Bool)

(declare-fun arr!237 () array!6077)

(declare-datatypes ((tuple2!11378 0))(
  ( (tuple2!11379 (_1!5992 BitStream!4766) (_2!5992 BitStream!4766)) )
))
(declare-fun lt!203136 () tuple2!11378)

(declare-datatypes ((tuple2!11380 0))(
  ( (tuple2!11381 (_1!5993 BitStream!4766) (_2!5993 (_ BitVec 8))) )
))
(declare-fun lt!203131 () tuple2!11380)

(assert (=> b!131630 (= e!87252 (and (= (_2!5993 lt!203131) (select (arr!3380 arr!237) from!447)) (= (_1!5993 lt!203131) (_2!5992 lt!203136))))))

(declare-fun readBytePure!0 (BitStream!4766) tuple2!11380)

(assert (=> b!131630 (= lt!203131 (readBytePure!0 (_1!5992 lt!203136)))))

(declare-datatypes ((Unit!8125 0))(
  ( (Unit!8126) )
))
(declare-datatypes ((tuple2!11382 0))(
  ( (tuple2!11383 (_1!5994 Unit!8125) (_2!5994 BitStream!4766)) )
))
(declare-fun lt!203133 () tuple2!11382)

(declare-fun reader!0 (BitStream!4766 BitStream!4766) tuple2!11378)

(assert (=> b!131630 (= lt!203136 (reader!0 thiss!1634 (_2!5994 lt!203133)))))

(declare-fun b!131631 () Bool)

(declare-fun e!87251 () Bool)

(declare-fun e!87244 () Bool)

(assert (=> b!131631 (= e!87251 e!87244)))

(declare-fun res!109217 () Bool)

(assert (=> b!131631 (=> (not res!109217) (not e!87244))))

(declare-fun lt!203135 () (_ BitVec 64))

(declare-fun lt!203141 () tuple2!11382)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!131631 (= res!109217 (= (bitIndex!0 (size!2751 (buf!3118 (_2!5994 lt!203141))) (currentByte!5897 (_2!5994 lt!203141)) (currentBit!5892 (_2!5994 lt!203141))) (bvadd (bitIndex!0 (size!2751 (buf!3118 (_2!5994 lt!203133))) (currentByte!5897 (_2!5994 lt!203133)) (currentBit!5892 (_2!5994 lt!203133))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!203135))))))

(assert (=> b!131631 (= lt!203135 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!131632 () Bool)

(declare-fun e!87247 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131632 (= e!87247 (invariant!0 (currentBit!5892 thiss!1634) (currentByte!5897 thiss!1634) (size!2751 (buf!3118 (_2!5994 lt!203133)))))))

(declare-fun b!131633 () Bool)

(declare-fun res!109221 () Bool)

(assert (=> b!131633 (=> (not res!109221) (not e!87252))))

(assert (=> b!131633 (= res!109221 (= (bitIndex!0 (size!2751 (buf!3118 (_2!5994 lt!203133))) (currentByte!5897 (_2!5994 lt!203133)) (currentBit!5892 (_2!5994 lt!203133))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2751 (buf!3118 thiss!1634)) (currentByte!5897 thiss!1634) (currentBit!5892 thiss!1634)))))))

(declare-fun lt!203129 () tuple2!11378)

(declare-fun e!87250 () Bool)

(declare-fun b!131634 () Bool)

(declare-datatypes ((tuple2!11384 0))(
  ( (tuple2!11385 (_1!5995 BitStream!4766) (_2!5995 array!6077)) )
))
(declare-fun readByteArrayLoopPure!0 (BitStream!4766 array!6077 (_ BitVec 32) (_ BitVec 32)) tuple2!11384)

(assert (=> b!131634 (= e!87250 (= (_1!5995 (readByteArrayLoopPure!0 (_1!5992 lt!203129) arr!237 from!447 to!404)) (_2!5992 lt!203129)))))

(declare-fun b!131635 () Bool)

(assert (=> b!131635 (= e!87248 (not true))))

(assert (=> b!131635 e!87250))

(declare-fun res!109216 () Bool)

(assert (=> b!131635 (=> (not res!109216) (not e!87250))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!131635 (= res!109216 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2751 (buf!3118 (_2!5994 lt!203141)))) ((_ sign_extend 32) (currentByte!5897 thiss!1634)) ((_ sign_extend 32) (currentBit!5892 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun lt!203128 () Unit!8125)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4766 array!6077 (_ BitVec 32)) Unit!8125)

(assert (=> b!131635 (= lt!203128 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3118 (_2!5994 lt!203141)) (bvsub to!404 from!447)))))

(assert (=> b!131635 (= (_2!5993 (readBytePure!0 (_1!5992 lt!203129))) (select (arr!3380 arr!237) from!447))))

(declare-fun lt!203127 () tuple2!11378)

(assert (=> b!131635 (= lt!203127 (reader!0 (_2!5994 lt!203133) (_2!5994 lt!203141)))))

(assert (=> b!131635 (= lt!203129 (reader!0 thiss!1634 (_2!5994 lt!203141)))))

(declare-fun e!87253 () Bool)

(assert (=> b!131635 e!87253))

(declare-fun res!109224 () Bool)

(assert (=> b!131635 (=> (not res!109224) (not e!87253))))

(declare-fun lt!203132 () tuple2!11380)

(declare-fun lt!203134 () tuple2!11380)

(assert (=> b!131635 (= res!109224 (= (bitIndex!0 (size!2751 (buf!3118 (_1!5993 lt!203132))) (currentByte!5897 (_1!5993 lt!203132)) (currentBit!5892 (_1!5993 lt!203132))) (bitIndex!0 (size!2751 (buf!3118 (_1!5993 lt!203134))) (currentByte!5897 (_1!5993 lt!203134)) (currentBit!5892 (_1!5993 lt!203134)))))))

(declare-fun lt!203137 () Unit!8125)

(declare-fun lt!203130 () BitStream!4766)

(declare-fun readBytePrefixLemma!0 (BitStream!4766 BitStream!4766) Unit!8125)

(assert (=> b!131635 (= lt!203137 (readBytePrefixLemma!0 lt!203130 (_2!5994 lt!203141)))))

(assert (=> b!131635 (= lt!203134 (readBytePure!0 (BitStream!4767 (buf!3118 (_2!5994 lt!203141)) (currentByte!5897 thiss!1634) (currentBit!5892 thiss!1634))))))

(assert (=> b!131635 (= lt!203132 (readBytePure!0 lt!203130))))

(assert (=> b!131635 (= lt!203130 (BitStream!4767 (buf!3118 (_2!5994 lt!203133)) (currentByte!5897 thiss!1634) (currentBit!5892 thiss!1634)))))

(assert (=> b!131635 e!87247))

(declare-fun res!109222 () Bool)

(assert (=> b!131635 (=> (not res!109222) (not e!87247))))

(declare-fun isPrefixOf!0 (BitStream!4766 BitStream!4766) Bool)

(assert (=> b!131635 (= res!109222 (isPrefixOf!0 thiss!1634 (_2!5994 lt!203141)))))

(declare-fun lt!203140 () Unit!8125)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4766 BitStream!4766 BitStream!4766) Unit!8125)

(assert (=> b!131635 (= lt!203140 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5994 lt!203133) (_2!5994 lt!203141)))))

(assert (=> b!131635 e!87251))

(declare-fun res!109225 () Bool)

(assert (=> b!131635 (=> (not res!109225) (not e!87251))))

(assert (=> b!131635 (= res!109225 (= (size!2751 (buf!3118 (_2!5994 lt!203133))) (size!2751 (buf!3118 (_2!5994 lt!203141)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4766 array!6077 (_ BitVec 32) (_ BitVec 32)) tuple2!11382)

(assert (=> b!131635 (= lt!203141 (appendByteArrayLoop!0 (_2!5994 lt!203133) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!131635 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2751 (buf!3118 (_2!5994 lt!203133)))) ((_ sign_extend 32) (currentByte!5897 (_2!5994 lt!203133))) ((_ sign_extend 32) (currentBit!5892 (_2!5994 lt!203133))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!203125 () Unit!8125)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4766 BitStream!4766 (_ BitVec 64) (_ BitVec 32)) Unit!8125)

(assert (=> b!131635 (= lt!203125 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5994 lt!203133) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!131635 e!87252))

(declare-fun res!109223 () Bool)

(assert (=> b!131635 (=> (not res!109223) (not e!87252))))

(assert (=> b!131635 (= res!109223 (= (size!2751 (buf!3118 thiss!1634)) (size!2751 (buf!3118 (_2!5994 lt!203133)))))))

(declare-fun appendByte!0 (BitStream!4766 (_ BitVec 8)) tuple2!11382)

(assert (=> b!131635 (= lt!203133 (appendByte!0 thiss!1634 (select (arr!3380 arr!237) from!447)))))

(declare-fun b!131636 () Bool)

(declare-fun e!87245 () Bool)

(assert (=> b!131636 (= e!87244 (not e!87245))))

(declare-fun res!109215 () Bool)

(assert (=> b!131636 (=> res!109215 e!87245)))

(declare-fun lt!203126 () tuple2!11378)

(declare-fun lt!203138 () tuple2!11384)

(assert (=> b!131636 (= res!109215 (or (not (= (size!2751 (_2!5995 lt!203138)) (size!2751 arr!237))) (not (= (_1!5995 lt!203138) (_2!5992 lt!203126)))))))

(assert (=> b!131636 (= lt!203138 (readByteArrayLoopPure!0 (_1!5992 lt!203126) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!131636 (validate_offset_bits!1 ((_ sign_extend 32) (size!2751 (buf!3118 (_2!5994 lt!203141)))) ((_ sign_extend 32) (currentByte!5897 (_2!5994 lt!203133))) ((_ sign_extend 32) (currentBit!5892 (_2!5994 lt!203133))) lt!203135)))

(declare-fun lt!203139 () Unit!8125)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4766 array!6077 (_ BitVec 64)) Unit!8125)

(assert (=> b!131636 (= lt!203139 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5994 lt!203133) (buf!3118 (_2!5994 lt!203141)) lt!203135))))

(assert (=> b!131636 (= lt!203126 (reader!0 (_2!5994 lt!203133) (_2!5994 lt!203141)))))

(declare-fun b!131637 () Bool)

(declare-fun res!109220 () Bool)

(assert (=> b!131637 (=> (not res!109220) (not e!87248))))

(assert (=> b!131637 (= res!109220 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2751 (buf!3118 thiss!1634))) ((_ sign_extend 32) (currentByte!5897 thiss!1634)) ((_ sign_extend 32) (currentBit!5892 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!131638 () Bool)

(declare-fun arrayRangesEq!154 (array!6077 array!6077 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!131638 (= e!87245 (not (arrayRangesEq!154 arr!237 (_2!5995 lt!203138) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!131639 () Bool)

(declare-fun res!109218 () Bool)

(assert (=> b!131639 (=> (not res!109218) (not e!87252))))

(assert (=> b!131639 (= res!109218 (isPrefixOf!0 thiss!1634 (_2!5994 lt!203133)))))

(declare-fun b!131640 () Bool)

(assert (=> b!131640 (= e!87253 (= (_2!5993 lt!203132) (_2!5993 lt!203134)))))

(declare-fun b!131641 () Bool)

(declare-fun res!109213 () Bool)

(assert (=> b!131641 (=> (not res!109213) (not e!87244))))

(assert (=> b!131641 (= res!109213 (isPrefixOf!0 (_2!5994 lt!203133) (_2!5994 lt!203141)))))

(declare-fun res!109214 () Bool)

(assert (=> start!25802 (=> (not res!109214) (not e!87248))))

(assert (=> start!25802 (= res!109214 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2751 arr!237))))))

(assert (=> start!25802 e!87248))

(assert (=> start!25802 true))

(assert (=> start!25802 (array_inv!2540 arr!237)))

(declare-fun inv!12 (BitStream!4766) Bool)

(assert (=> start!25802 (and (inv!12 thiss!1634) e!87254)))

(declare-fun b!131642 () Bool)

(declare-fun res!109219 () Bool)

(assert (=> b!131642 (=> (not res!109219) (not e!87248))))

(assert (=> b!131642 (= res!109219 (invariant!0 (currentBit!5892 thiss!1634) (currentByte!5897 thiss!1634) (size!2751 (buf!3118 thiss!1634))))))

(assert (= (and start!25802 res!109214) b!131637))

(assert (= (and b!131637 res!109220) b!131628))

(assert (= (and b!131628 res!109212) b!131642))

(assert (= (and b!131642 res!109219) b!131635))

(assert (= (and b!131635 res!109223) b!131633))

(assert (= (and b!131633 res!109221) b!131639))

(assert (= (and b!131639 res!109218) b!131630))

(assert (= (and b!131635 res!109225) b!131631))

(assert (= (and b!131631 res!109217) b!131641))

(assert (= (and b!131641 res!109213) b!131636))

(assert (= (and b!131636 (not res!109215)) b!131638))

(assert (= (and b!131635 res!109222) b!131632))

(assert (= (and b!131635 res!109224) b!131640))

(assert (= (and b!131635 res!109216) b!131634))

(assert (= start!25802 b!131629))

(declare-fun m!198693 () Bool)

(assert (=> b!131637 m!198693))

(declare-fun m!198695 () Bool)

(assert (=> b!131636 m!198695))

(declare-fun m!198697 () Bool)

(assert (=> b!131636 m!198697))

(declare-fun m!198699 () Bool)

(assert (=> b!131636 m!198699))

(declare-fun m!198701 () Bool)

(assert (=> b!131636 m!198701))

(declare-fun m!198703 () Bool)

(assert (=> start!25802 m!198703))

(declare-fun m!198705 () Bool)

(assert (=> start!25802 m!198705))

(declare-fun m!198707 () Bool)

(assert (=> b!131635 m!198707))

(declare-fun m!198709 () Bool)

(assert (=> b!131635 m!198709))

(declare-fun m!198711 () Bool)

(assert (=> b!131635 m!198711))

(declare-fun m!198713 () Bool)

(assert (=> b!131635 m!198713))

(declare-fun m!198715 () Bool)

(assert (=> b!131635 m!198715))

(assert (=> b!131635 m!198701))

(declare-fun m!198717 () Bool)

(assert (=> b!131635 m!198717))

(declare-fun m!198719 () Bool)

(assert (=> b!131635 m!198719))

(declare-fun m!198721 () Bool)

(assert (=> b!131635 m!198721))

(declare-fun m!198723 () Bool)

(assert (=> b!131635 m!198723))

(declare-fun m!198725 () Bool)

(assert (=> b!131635 m!198725))

(declare-fun m!198727 () Bool)

(assert (=> b!131635 m!198727))

(declare-fun m!198729 () Bool)

(assert (=> b!131635 m!198729))

(assert (=> b!131635 m!198725))

(declare-fun m!198731 () Bool)

(assert (=> b!131635 m!198731))

(declare-fun m!198733 () Bool)

(assert (=> b!131635 m!198733))

(declare-fun m!198735 () Bool)

(assert (=> b!131635 m!198735))

(declare-fun m!198737 () Bool)

(assert (=> b!131635 m!198737))

(declare-fun m!198739 () Bool)

(assert (=> b!131632 m!198739))

(declare-fun m!198741 () Bool)

(assert (=> b!131642 m!198741))

(declare-fun m!198743 () Bool)

(assert (=> b!131639 m!198743))

(declare-fun m!198745 () Bool)

(assert (=> b!131641 m!198745))

(declare-fun m!198747 () Bool)

(assert (=> b!131629 m!198747))

(declare-fun m!198749 () Bool)

(assert (=> b!131631 m!198749))

(declare-fun m!198751 () Bool)

(assert (=> b!131631 m!198751))

(assert (=> b!131633 m!198751))

(declare-fun m!198753 () Bool)

(assert (=> b!131633 m!198753))

(assert (=> b!131630 m!198725))

(declare-fun m!198755 () Bool)

(assert (=> b!131630 m!198755))

(declare-fun m!198757 () Bool)

(assert (=> b!131630 m!198757))

(declare-fun m!198759 () Bool)

(assert (=> b!131638 m!198759))

(declare-fun m!198761 () Bool)

(assert (=> b!131634 m!198761))

(push 1)

(assert (not b!131641))

(assert (not start!25802))

(assert (not b!131632))

(assert (not b!131638))

(assert (not b!131637))

(assert (not b!131636))

(assert (not b!131629))

(assert (not b!131633))

(assert (not b!131634))

(assert (not b!131639))

(assert (not b!131635))

(assert (not b!131631))

(assert (not b!131630))

(assert (not b!131642))

(check-sat)


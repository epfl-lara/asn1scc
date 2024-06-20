; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25664 () Bool)

(assert start!25664)

(declare-fun res!108376 () Bool)

(declare-fun e!86630 () Bool)

(assert (=> start!25664 (=> (not res!108376) (not e!86630))))

(declare-datatypes ((array!6044 0))(
  ( (array!6045 (arr!3359 (Array (_ BitVec 32) (_ BitVec 8))) (size!2736 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6044)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!25664 (= res!108376 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2736 arr!237))))))

(assert (=> start!25664 e!86630))

(assert (=> start!25664 true))

(declare-fun array_inv!2525 (array!6044) Bool)

(assert (=> start!25664 (array_inv!2525 arr!237)))

(declare-datatypes ((BitStream!4736 0))(
  ( (BitStream!4737 (buf!3097 array!6044) (currentByte!5870 (_ BitVec 32)) (currentBit!5865 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4736)

(declare-fun e!86631 () Bool)

(declare-fun inv!12 (BitStream!4736) Bool)

(assert (=> start!25664 (and (inv!12 thiss!1634) e!86631)))

(declare-fun b!130711 () Bool)

(declare-fun e!86633 () Bool)

(declare-fun e!86625 () Bool)

(assert (=> b!130711 (= e!86633 e!86625)))

(declare-fun res!108374 () Bool)

(assert (=> b!130711 (=> (not res!108374) (not e!86625))))

(declare-fun lt!201703 () (_ BitVec 64))

(declare-datatypes ((Unit!8086 0))(
  ( (Unit!8087) )
))
(declare-datatypes ((tuple2!11252 0))(
  ( (tuple2!11253 (_1!5926 Unit!8086) (_2!5926 BitStream!4736)) )
))
(declare-fun lt!201701 () tuple2!11252)

(declare-fun lt!201711 () tuple2!11252)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!130711 (= res!108374 (= (bitIndex!0 (size!2736 (buf!3097 (_2!5926 lt!201711))) (currentByte!5870 (_2!5926 lt!201711)) (currentBit!5865 (_2!5926 lt!201711))) (bvadd (bitIndex!0 (size!2736 (buf!3097 (_2!5926 lt!201701))) (currentByte!5870 (_2!5926 lt!201701)) (currentBit!5865 (_2!5926 lt!201701))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!201703))))))

(assert (=> b!130711 (= lt!201703 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!130712 () Bool)

(assert (=> b!130712 (= e!86631 (array_inv!2525 (buf!3097 thiss!1634)))))

(declare-fun b!130713 () Bool)

(declare-fun res!108375 () Bool)

(assert (=> b!130713 (=> (not res!108375) (not e!86630))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130713 (= res!108375 (invariant!0 (currentBit!5865 thiss!1634) (currentByte!5870 thiss!1634) (size!2736 (buf!3097 thiss!1634))))))

(declare-fun b!130714 () Bool)

(declare-fun e!86628 () Bool)

(declare-datatypes ((tuple2!11254 0))(
  ( (tuple2!11255 (_1!5927 BitStream!4736) (_2!5927 (_ BitVec 8))) )
))
(declare-fun lt!201706 () tuple2!11254)

(declare-fun lt!201707 () tuple2!11254)

(assert (=> b!130714 (= e!86628 (= (_2!5927 lt!201706) (_2!5927 lt!201707)))))

(declare-fun b!130715 () Bool)

(declare-fun e!86627 () Bool)

(assert (=> b!130715 (= e!86625 (not e!86627))))

(declare-fun res!108379 () Bool)

(assert (=> b!130715 (=> res!108379 e!86627)))

(declare-datatypes ((tuple2!11256 0))(
  ( (tuple2!11257 (_1!5928 BitStream!4736) (_2!5928 array!6044)) )
))
(declare-fun lt!201714 () tuple2!11256)

(declare-datatypes ((tuple2!11258 0))(
  ( (tuple2!11259 (_1!5929 BitStream!4736) (_2!5929 BitStream!4736)) )
))
(declare-fun lt!201715 () tuple2!11258)

(assert (=> b!130715 (= res!108379 (or (not (= (size!2736 (_2!5928 lt!201714)) (size!2736 arr!237))) (not (= (_1!5928 lt!201714) (_2!5929 lt!201715)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4736 array!6044 (_ BitVec 32) (_ BitVec 32)) tuple2!11256)

(assert (=> b!130715 (= lt!201714 (readByteArrayLoopPure!0 (_1!5929 lt!201715) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!130715 (validate_offset_bits!1 ((_ sign_extend 32) (size!2736 (buf!3097 (_2!5926 lt!201711)))) ((_ sign_extend 32) (currentByte!5870 (_2!5926 lt!201701))) ((_ sign_extend 32) (currentBit!5865 (_2!5926 lt!201701))) lt!201703)))

(declare-fun lt!201702 () Unit!8086)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4736 array!6044 (_ BitVec 64)) Unit!8086)

(assert (=> b!130715 (= lt!201702 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5926 lt!201701) (buf!3097 (_2!5926 lt!201711)) lt!201703))))

(declare-fun reader!0 (BitStream!4736 BitStream!4736) tuple2!11258)

(assert (=> b!130715 (= lt!201715 (reader!0 (_2!5926 lt!201701) (_2!5926 lt!201711)))))

(declare-fun b!130716 () Bool)

(declare-fun e!86632 () Bool)

(assert (=> b!130716 (= e!86632 (invariant!0 (currentBit!5865 thiss!1634) (currentByte!5870 thiss!1634) (size!2736 (buf!3097 (_2!5926 lt!201701)))))))

(declare-fun e!86629 () Bool)

(declare-fun b!130717 () Bool)

(declare-fun lt!201710 () tuple2!11258)

(declare-fun lt!201705 () tuple2!11254)

(assert (=> b!130717 (= e!86629 (and (= (_2!5927 lt!201705) (select (arr!3359 arr!237) from!447)) (= (_1!5927 lt!201705) (_2!5929 lt!201710))))))

(declare-fun readBytePure!0 (BitStream!4736) tuple2!11254)

(assert (=> b!130717 (= lt!201705 (readBytePure!0 (_1!5929 lt!201710)))))

(assert (=> b!130717 (= lt!201710 (reader!0 thiss!1634 (_2!5926 lt!201701)))))

(declare-fun b!130718 () Bool)

(declare-fun res!108381 () Bool)

(assert (=> b!130718 (=> (not res!108381) (not e!86630))))

(assert (=> b!130718 (= res!108381 (bvslt from!447 to!404))))

(declare-fun b!130719 () Bool)

(declare-fun res!108380 () Bool)

(assert (=> b!130719 (=> (not res!108380) (not e!86625))))

(declare-fun isPrefixOf!0 (BitStream!4736 BitStream!4736) Bool)

(assert (=> b!130719 (= res!108380 (isPrefixOf!0 (_2!5926 lt!201701) (_2!5926 lt!201711)))))

(declare-fun b!130720 () Bool)

(declare-fun res!108377 () Bool)

(assert (=> b!130720 (=> (not res!108377) (not e!86629))))

(assert (=> b!130720 (= res!108377 (isPrefixOf!0 thiss!1634 (_2!5926 lt!201701)))))

(declare-fun b!130721 () Bool)

(declare-fun arrayRangesEq!139 (array!6044 array!6044 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!130721 (= e!86627 (not (arrayRangesEq!139 arr!237 (_2!5928 lt!201714) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!130722 () Bool)

(assert (=> b!130722 (= e!86630 (not true))))

(declare-fun lt!201708 () tuple2!11258)

(assert (=> b!130722 (= (_2!5927 (readBytePure!0 (_1!5929 lt!201708))) (select (arr!3359 arr!237) from!447))))

(declare-fun lt!201716 () tuple2!11258)

(assert (=> b!130722 (= lt!201716 (reader!0 (_2!5926 lt!201701) (_2!5926 lt!201711)))))

(assert (=> b!130722 (= lt!201708 (reader!0 thiss!1634 (_2!5926 lt!201711)))))

(assert (=> b!130722 e!86628))

(declare-fun res!108370 () Bool)

(assert (=> b!130722 (=> (not res!108370) (not e!86628))))

(assert (=> b!130722 (= res!108370 (= (bitIndex!0 (size!2736 (buf!3097 (_1!5927 lt!201706))) (currentByte!5870 (_1!5927 lt!201706)) (currentBit!5865 (_1!5927 lt!201706))) (bitIndex!0 (size!2736 (buf!3097 (_1!5927 lt!201707))) (currentByte!5870 (_1!5927 lt!201707)) (currentBit!5865 (_1!5927 lt!201707)))))))

(declare-fun lt!201713 () Unit!8086)

(declare-fun lt!201712 () BitStream!4736)

(declare-fun readBytePrefixLemma!0 (BitStream!4736 BitStream!4736) Unit!8086)

(assert (=> b!130722 (= lt!201713 (readBytePrefixLemma!0 lt!201712 (_2!5926 lt!201711)))))

(assert (=> b!130722 (= lt!201707 (readBytePure!0 (BitStream!4737 (buf!3097 (_2!5926 lt!201711)) (currentByte!5870 thiss!1634) (currentBit!5865 thiss!1634))))))

(assert (=> b!130722 (= lt!201706 (readBytePure!0 lt!201712))))

(assert (=> b!130722 (= lt!201712 (BitStream!4737 (buf!3097 (_2!5926 lt!201701)) (currentByte!5870 thiss!1634) (currentBit!5865 thiss!1634)))))

(assert (=> b!130722 e!86632))

(declare-fun res!108378 () Bool)

(assert (=> b!130722 (=> (not res!108378) (not e!86632))))

(assert (=> b!130722 (= res!108378 (isPrefixOf!0 thiss!1634 (_2!5926 lt!201711)))))

(declare-fun lt!201704 () Unit!8086)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4736 BitStream!4736 BitStream!4736) Unit!8086)

(assert (=> b!130722 (= lt!201704 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!5926 lt!201701) (_2!5926 lt!201711)))))

(assert (=> b!130722 e!86633))

(declare-fun res!108372 () Bool)

(assert (=> b!130722 (=> (not res!108372) (not e!86633))))

(assert (=> b!130722 (= res!108372 (= (size!2736 (buf!3097 (_2!5926 lt!201701))) (size!2736 (buf!3097 (_2!5926 lt!201711)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4736 array!6044 (_ BitVec 32) (_ BitVec 32)) tuple2!11252)

(assert (=> b!130722 (= lt!201711 (appendByteArrayLoop!0 (_2!5926 lt!201701) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!130722 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2736 (buf!3097 (_2!5926 lt!201701)))) ((_ sign_extend 32) (currentByte!5870 (_2!5926 lt!201701))) ((_ sign_extend 32) (currentBit!5865 (_2!5926 lt!201701))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!201709 () Unit!8086)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4736 BitStream!4736 (_ BitVec 64) (_ BitVec 32)) Unit!8086)

(assert (=> b!130722 (= lt!201709 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5926 lt!201701) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!130722 e!86629))

(declare-fun res!108371 () Bool)

(assert (=> b!130722 (=> (not res!108371) (not e!86629))))

(assert (=> b!130722 (= res!108371 (= (size!2736 (buf!3097 thiss!1634)) (size!2736 (buf!3097 (_2!5926 lt!201701)))))))

(declare-fun appendByte!0 (BitStream!4736 (_ BitVec 8)) tuple2!11252)

(assert (=> b!130722 (= lt!201701 (appendByte!0 thiss!1634 (select (arr!3359 arr!237) from!447)))))

(declare-fun b!130723 () Bool)

(declare-fun res!108382 () Bool)

(assert (=> b!130723 (=> (not res!108382) (not e!86629))))

(assert (=> b!130723 (= res!108382 (= (bitIndex!0 (size!2736 (buf!3097 (_2!5926 lt!201701))) (currentByte!5870 (_2!5926 lt!201701)) (currentBit!5865 (_2!5926 lt!201701))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2736 (buf!3097 thiss!1634)) (currentByte!5870 thiss!1634) (currentBit!5865 thiss!1634)))))))

(declare-fun b!130724 () Bool)

(declare-fun res!108373 () Bool)

(assert (=> b!130724 (=> (not res!108373) (not e!86630))))

(assert (=> b!130724 (= res!108373 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2736 (buf!3097 thiss!1634))) ((_ sign_extend 32) (currentByte!5870 thiss!1634)) ((_ sign_extend 32) (currentBit!5865 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!25664 res!108376) b!130724))

(assert (= (and b!130724 res!108373) b!130718))

(assert (= (and b!130718 res!108381) b!130713))

(assert (= (and b!130713 res!108375) b!130722))

(assert (= (and b!130722 res!108371) b!130723))

(assert (= (and b!130723 res!108382) b!130720))

(assert (= (and b!130720 res!108377) b!130717))

(assert (= (and b!130722 res!108372) b!130711))

(assert (= (and b!130711 res!108374) b!130719))

(assert (= (and b!130719 res!108380) b!130715))

(assert (= (and b!130715 (not res!108379)) b!130721))

(assert (= (and b!130722 res!108378) b!130716))

(assert (= (and b!130722 res!108370) b!130714))

(assert (= start!25664 b!130712))

(declare-fun m!197157 () Bool)

(assert (=> start!25664 m!197157))

(declare-fun m!197159 () Bool)

(assert (=> start!25664 m!197159))

(declare-fun m!197161 () Bool)

(assert (=> b!130715 m!197161))

(declare-fun m!197163 () Bool)

(assert (=> b!130715 m!197163))

(declare-fun m!197165 () Bool)

(assert (=> b!130715 m!197165))

(declare-fun m!197167 () Bool)

(assert (=> b!130715 m!197167))

(declare-fun m!197169 () Bool)

(assert (=> b!130717 m!197169))

(declare-fun m!197171 () Bool)

(assert (=> b!130717 m!197171))

(declare-fun m!197173 () Bool)

(assert (=> b!130717 m!197173))

(declare-fun m!197175 () Bool)

(assert (=> b!130724 m!197175))

(declare-fun m!197177 () Bool)

(assert (=> b!130719 m!197177))

(declare-fun m!197179 () Bool)

(assert (=> b!130722 m!197179))

(assert (=> b!130722 m!197167))

(declare-fun m!197181 () Bool)

(assert (=> b!130722 m!197181))

(declare-fun m!197183 () Bool)

(assert (=> b!130722 m!197183))

(declare-fun m!197185 () Bool)

(assert (=> b!130722 m!197185))

(declare-fun m!197187 () Bool)

(assert (=> b!130722 m!197187))

(declare-fun m!197189 () Bool)

(assert (=> b!130722 m!197189))

(declare-fun m!197191 () Bool)

(assert (=> b!130722 m!197191))

(assert (=> b!130722 m!197169))

(declare-fun m!197193 () Bool)

(assert (=> b!130722 m!197193))

(declare-fun m!197195 () Bool)

(assert (=> b!130722 m!197195))

(declare-fun m!197197 () Bool)

(assert (=> b!130722 m!197197))

(declare-fun m!197199 () Bool)

(assert (=> b!130722 m!197199))

(declare-fun m!197201 () Bool)

(assert (=> b!130722 m!197201))

(declare-fun m!197203 () Bool)

(assert (=> b!130722 m!197203))

(assert (=> b!130722 m!197169))

(declare-fun m!197205 () Bool)

(assert (=> b!130711 m!197205))

(declare-fun m!197207 () Bool)

(assert (=> b!130711 m!197207))

(declare-fun m!197209 () Bool)

(assert (=> b!130721 m!197209))

(declare-fun m!197211 () Bool)

(assert (=> b!130716 m!197211))

(assert (=> b!130723 m!197207))

(declare-fun m!197213 () Bool)

(assert (=> b!130723 m!197213))

(declare-fun m!197215 () Bool)

(assert (=> b!130713 m!197215))

(declare-fun m!197217 () Bool)

(assert (=> b!130712 m!197217))

(declare-fun m!197219 () Bool)

(assert (=> b!130720 m!197219))

(push 1)

(assert (not b!130720))

(assert (not b!130713))

(assert (not b!130721))

(assert (not b!130722))

(assert (not b!130711))

(assert (not start!25664))

(assert (not b!130724))

(assert (not b!130716))

(assert (not b!130719))

(assert (not b!130715))

(assert (not b!130723))

(assert (not b!130717))

(assert (not b!130712))

(check-sat)


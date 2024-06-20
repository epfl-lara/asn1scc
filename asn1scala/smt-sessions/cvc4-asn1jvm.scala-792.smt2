; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22974 () Bool)

(assert start!22974)

(declare-fun b!116270 () Bool)

(declare-fun e!76192 () Bool)

(declare-datatypes ((array!5238 0))(
  ( (array!5239 (arr!2969 (Array (_ BitVec 32) (_ BitVec 8))) (size!2376 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4226 0))(
  ( (BitStream!4227 (buf!2786 array!5238) (currentByte!5423 (_ BitVec 32)) (currentBit!5418 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4226)

(declare-datatypes ((Unit!7157 0))(
  ( (Unit!7158) )
))
(declare-datatypes ((tuple2!9608 0))(
  ( (tuple2!9609 (_1!5069 Unit!7157) (_2!5069 BitStream!4226)) )
))
(declare-fun lt!177704 () tuple2!9608)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116270 (= e!76192 (invariant!0 (currentBit!5418 thiss!1305) (currentByte!5423 thiss!1305) (size!2376 (buf!2786 (_2!5069 lt!177704)))))))

(declare-fun b!116271 () Bool)

(declare-fun e!76195 () Bool)

(declare-fun e!76191 () Bool)

(assert (=> b!116271 (= e!76195 e!76191)))

(declare-fun res!96120 () Bool)

(assert (=> b!116271 (=> (not res!96120) (not e!76191))))

(declare-fun lt!177691 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116271 (= res!96120 (validate_offset_bits!1 ((_ sign_extend 32) (size!2376 (buf!2786 thiss!1305))) ((_ sign_extend 32) (currentByte!5423 thiss!1305)) ((_ sign_extend 32) (currentBit!5418 thiss!1305)) lt!177691))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!116271 (= lt!177691 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116272 () Bool)

(declare-fun e!76193 () Bool)

(declare-datatypes ((tuple2!9610 0))(
  ( (tuple2!9611 (_1!5070 BitStream!4226) (_2!5070 Bool)) )
))
(declare-fun lt!177694 () tuple2!9610)

(declare-fun lt!177700 () tuple2!9610)

(assert (=> b!116272 (= e!76193 (= (_2!5070 lt!177694) (_2!5070 lt!177700)))))

(declare-fun b!116273 () Bool)

(declare-fun res!96121 () Bool)

(declare-fun e!76194 () Bool)

(assert (=> b!116273 (=> (not res!96121) (not e!76194))))

(declare-fun lt!177695 () tuple2!9608)

(declare-fun isPrefixOf!0 (BitStream!4226 BitStream!4226) Bool)

(assert (=> b!116273 (= res!96121 (isPrefixOf!0 thiss!1305 (_2!5069 lt!177695)))))

(declare-fun b!116274 () Bool)

(declare-fun e!76189 () Bool)

(assert (=> b!116274 (= e!76194 e!76189)))

(declare-fun res!96123 () Bool)

(assert (=> b!116274 (=> (not res!96123) (not e!76189))))

(declare-fun lt!177689 () Bool)

(declare-fun lt!177696 () tuple2!9610)

(assert (=> b!116274 (= res!96123 (and (= (_2!5070 lt!177696) lt!177689) (= (_1!5070 lt!177696) (_2!5069 lt!177695))))))

(declare-fun readBitPure!0 (BitStream!4226) tuple2!9610)

(declare-fun readerFrom!0 (BitStream!4226 (_ BitVec 32) (_ BitVec 32)) BitStream!4226)

(assert (=> b!116274 (= lt!177696 (readBitPure!0 (readerFrom!0 (_2!5069 lt!177695) (currentBit!5418 thiss!1305) (currentByte!5423 thiss!1305))))))

(declare-fun b!116275 () Bool)

(declare-fun lt!177702 () tuple2!9610)

(assert (=> b!116275 (= e!76191 (not (or (not (_2!5070 lt!177702)) (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9612 0))(
  ( (tuple2!9613 (_1!5071 BitStream!4226) (_2!5071 BitStream!4226)) )
))
(declare-fun lt!177697 () tuple2!9612)

(declare-datatypes ((tuple2!9614 0))(
  ( (tuple2!9615 (_1!5072 BitStream!4226) (_2!5072 (_ BitVec 64))) )
))
(declare-fun lt!177701 () tuple2!9614)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4226 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9614)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116275 (= lt!177701 (readNLeastSignificantBitsLoopPure!0 (_1!5071 lt!177697) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!116275 (validate_offset_bits!1 ((_ sign_extend 32) (size!2376 (buf!2786 (_2!5069 lt!177704)))) ((_ sign_extend 32) (currentByte!5423 thiss!1305)) ((_ sign_extend 32) (currentBit!5418 thiss!1305)) lt!177691)))

(declare-fun lt!177699 () Unit!7157)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4226 array!5238 (_ BitVec 64)) Unit!7157)

(assert (=> b!116275 (= lt!177699 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2786 (_2!5069 lt!177704)) lt!177691))))

(assert (=> b!116275 (= (_2!5070 lt!177702) lt!177689)))

(assert (=> b!116275 (= lt!177702 (readBitPure!0 (_1!5071 lt!177697)))))

(declare-fun lt!177703 () tuple2!9612)

(declare-fun reader!0 (BitStream!4226 BitStream!4226) tuple2!9612)

(assert (=> b!116275 (= lt!177703 (reader!0 (_2!5069 lt!177695) (_2!5069 lt!177704)))))

(assert (=> b!116275 (= lt!177697 (reader!0 thiss!1305 (_2!5069 lt!177704)))))

(assert (=> b!116275 e!76193))

(declare-fun res!96122 () Bool)

(assert (=> b!116275 (=> (not res!96122) (not e!76193))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116275 (= res!96122 (= (bitIndex!0 (size!2376 (buf!2786 (_1!5070 lt!177694))) (currentByte!5423 (_1!5070 lt!177694)) (currentBit!5418 (_1!5070 lt!177694))) (bitIndex!0 (size!2376 (buf!2786 (_1!5070 lt!177700))) (currentByte!5423 (_1!5070 lt!177700)) (currentBit!5418 (_1!5070 lt!177700)))))))

(declare-fun lt!177698 () Unit!7157)

(declare-fun lt!177705 () BitStream!4226)

(declare-fun readBitPrefixLemma!0 (BitStream!4226 BitStream!4226) Unit!7157)

(assert (=> b!116275 (= lt!177698 (readBitPrefixLemma!0 lt!177705 (_2!5069 lt!177704)))))

(assert (=> b!116275 (= lt!177700 (readBitPure!0 (BitStream!4227 (buf!2786 (_2!5069 lt!177704)) (currentByte!5423 thiss!1305) (currentBit!5418 thiss!1305))))))

(assert (=> b!116275 (= lt!177694 (readBitPure!0 lt!177705))))

(assert (=> b!116275 (= lt!177705 (BitStream!4227 (buf!2786 (_2!5069 lt!177695)) (currentByte!5423 thiss!1305) (currentBit!5418 thiss!1305)))))

(assert (=> b!116275 e!76192))

(declare-fun res!96125 () Bool)

(assert (=> b!116275 (=> (not res!96125) (not e!76192))))

(assert (=> b!116275 (= res!96125 (isPrefixOf!0 thiss!1305 (_2!5069 lt!177704)))))

(declare-fun lt!177692 () Unit!7157)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4226 BitStream!4226 BitStream!4226) Unit!7157)

(assert (=> b!116275 (= lt!177692 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5069 lt!177695) (_2!5069 lt!177704)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4226 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9608)

(assert (=> b!116275 (= lt!177704 (appendNLeastSignificantBitsLoop!0 (_2!5069 lt!177695) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!76197 () Bool)

(assert (=> b!116275 e!76197))

(declare-fun res!96116 () Bool)

(assert (=> b!116275 (=> (not res!96116) (not e!76197))))

(assert (=> b!116275 (= res!96116 (= (size!2376 (buf!2786 thiss!1305)) (size!2376 (buf!2786 (_2!5069 lt!177695)))))))

(declare-fun appendBit!0 (BitStream!4226 Bool) tuple2!9608)

(assert (=> b!116275 (= lt!177695 (appendBit!0 thiss!1305 lt!177689))))

(assert (=> b!116275 (= lt!177689 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116276 () Bool)

(declare-fun e!76190 () Bool)

(declare-fun array_inv!2178 (array!5238) Bool)

(assert (=> b!116276 (= e!76190 (array_inv!2178 (buf!2786 thiss!1305)))))

(declare-fun b!116277 () Bool)

(declare-fun lt!177693 () (_ BitVec 64))

(assert (=> b!116277 (= e!76189 (= (bitIndex!0 (size!2376 (buf!2786 (_1!5070 lt!177696))) (currentByte!5423 (_1!5070 lt!177696)) (currentBit!5418 (_1!5070 lt!177696))) lt!177693))))

(declare-fun b!116278 () Bool)

(declare-fun res!96119 () Bool)

(assert (=> b!116278 (=> (not res!96119) (not e!76191))))

(assert (=> b!116278 (= res!96119 (bvslt i!615 nBits!396))))

(declare-fun b!116279 () Bool)

(assert (=> b!116279 (= e!76197 e!76194)))

(declare-fun res!96118 () Bool)

(assert (=> b!116279 (=> (not res!96118) (not e!76194))))

(declare-fun lt!177690 () (_ BitVec 64))

(assert (=> b!116279 (= res!96118 (= lt!177693 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!177690)))))

(assert (=> b!116279 (= lt!177693 (bitIndex!0 (size!2376 (buf!2786 (_2!5069 lt!177695))) (currentByte!5423 (_2!5069 lt!177695)) (currentBit!5418 (_2!5069 lt!177695))))))

(assert (=> b!116279 (= lt!177690 (bitIndex!0 (size!2376 (buf!2786 thiss!1305)) (currentByte!5423 thiss!1305) (currentBit!5418 thiss!1305)))))

(declare-fun b!116280 () Bool)

(declare-fun res!96126 () Bool)

(assert (=> b!116280 (=> (not res!96126) (not e!76192))))

(assert (=> b!116280 (= res!96126 (invariant!0 (currentBit!5418 thiss!1305) (currentByte!5423 thiss!1305) (size!2376 (buf!2786 (_2!5069 lt!177695)))))))

(declare-fun res!96117 () Bool)

(assert (=> start!22974 (=> (not res!96117) (not e!76195))))

(assert (=> start!22974 (= res!96117 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22974 e!76195))

(assert (=> start!22974 true))

(declare-fun inv!12 (BitStream!4226) Bool)

(assert (=> start!22974 (and (inv!12 thiss!1305) e!76190)))

(declare-fun b!116281 () Bool)

(declare-fun res!96124 () Bool)

(assert (=> b!116281 (=> (not res!96124) (not e!76191))))

(assert (=> b!116281 (= res!96124 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!22974 res!96117) b!116271))

(assert (= (and b!116271 res!96120) b!116281))

(assert (= (and b!116281 res!96124) b!116278))

(assert (= (and b!116278 res!96119) b!116275))

(assert (= (and b!116275 res!96116) b!116279))

(assert (= (and b!116279 res!96118) b!116273))

(assert (= (and b!116273 res!96121) b!116274))

(assert (= (and b!116274 res!96123) b!116277))

(assert (= (and b!116275 res!96125) b!116280))

(assert (= (and b!116280 res!96126) b!116270))

(assert (= (and b!116275 res!96122) b!116272))

(assert (= start!22974 b!116276))

(declare-fun m!174099 () Bool)

(assert (=> b!116270 m!174099))

(declare-fun m!174101 () Bool)

(assert (=> b!116279 m!174101))

(declare-fun m!174103 () Bool)

(assert (=> b!116279 m!174103))

(declare-fun m!174105 () Bool)

(assert (=> b!116281 m!174105))

(declare-fun m!174107 () Bool)

(assert (=> b!116273 m!174107))

(declare-fun m!174109 () Bool)

(assert (=> b!116271 m!174109))

(declare-fun m!174111 () Bool)

(assert (=> start!22974 m!174111))

(declare-fun m!174113 () Bool)

(assert (=> b!116280 m!174113))

(declare-fun m!174115 () Bool)

(assert (=> b!116274 m!174115))

(assert (=> b!116274 m!174115))

(declare-fun m!174117 () Bool)

(assert (=> b!116274 m!174117))

(declare-fun m!174119 () Bool)

(assert (=> b!116277 m!174119))

(declare-fun m!174121 () Bool)

(assert (=> b!116276 m!174121))

(declare-fun m!174123 () Bool)

(assert (=> b!116275 m!174123))

(declare-fun m!174125 () Bool)

(assert (=> b!116275 m!174125))

(declare-fun m!174127 () Bool)

(assert (=> b!116275 m!174127))

(declare-fun m!174129 () Bool)

(assert (=> b!116275 m!174129))

(declare-fun m!174131 () Bool)

(assert (=> b!116275 m!174131))

(declare-fun m!174133 () Bool)

(assert (=> b!116275 m!174133))

(declare-fun m!174135 () Bool)

(assert (=> b!116275 m!174135))

(declare-fun m!174137 () Bool)

(assert (=> b!116275 m!174137))

(declare-fun m!174139 () Bool)

(assert (=> b!116275 m!174139))

(declare-fun m!174141 () Bool)

(assert (=> b!116275 m!174141))

(declare-fun m!174143 () Bool)

(assert (=> b!116275 m!174143))

(declare-fun m!174145 () Bool)

(assert (=> b!116275 m!174145))

(declare-fun m!174147 () Bool)

(assert (=> b!116275 m!174147))

(declare-fun m!174149 () Bool)

(assert (=> b!116275 m!174149))

(declare-fun m!174151 () Bool)

(assert (=> b!116275 m!174151))

(declare-fun m!174153 () Bool)

(assert (=> b!116275 m!174153))

(push 1)

(assert (not b!116274))

(assert (not b!116273))

(assert (not b!116280))

(assert (not b!116279))

(assert (not b!116281))

(assert (not start!22974))

(assert (not b!116277))

(assert (not b!116270))

(assert (not b!116271))

(assert (not b!116275))

(assert (not b!116276))

(check-sat)

(pop 1)

(push 1)

(check-sat)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23102 () Bool)

(assert start!23102)

(declare-fun b!117158 () Bool)

(declare-fun res!96904 () Bool)

(declare-fun e!76791 () Bool)

(assert (=> b!117158 (=> (not res!96904) (not e!76791))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!117158 (= res!96904 (bvslt i!615 nBits!396))))

(declare-fun b!117159 () Bool)

(declare-fun res!96896 () Bool)

(declare-fun e!76796 () Bool)

(assert (=> b!117159 (=> (not res!96896) (not e!76796))))

(declare-datatypes ((array!5273 0))(
  ( (array!5274 (arr!2985 (Array (_ BitVec 32) (_ BitVec 8))) (size!2392 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4258 0))(
  ( (BitStream!4259 (buf!2805 array!5273) (currentByte!5448 (_ BitVec 32)) (currentBit!5443 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4258)

(declare-datatypes ((Unit!7207 0))(
  ( (Unit!7208) )
))
(declare-datatypes ((tuple2!9748 0))(
  ( (tuple2!9749 (_1!5139 Unit!7207) (_2!5139 BitStream!4258)) )
))
(declare-fun lt!179396 () tuple2!9748)

(declare-fun isPrefixOf!0 (BitStream!4258 BitStream!4258) Bool)

(assert (=> b!117159 (= res!96896 (isPrefixOf!0 thiss!1305 (_2!5139 lt!179396)))))

(declare-fun res!96901 () Bool)

(declare-fun e!76797 () Bool)

(assert (=> start!23102 (=> (not res!96901) (not e!76797))))

(assert (=> start!23102 (= res!96901 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23102 e!76797))

(assert (=> start!23102 true))

(declare-fun e!76793 () Bool)

(declare-fun inv!12 (BitStream!4258) Bool)

(assert (=> start!23102 (and (inv!12 thiss!1305) e!76793)))

(declare-fun b!117160 () Bool)

(declare-fun res!96903 () Bool)

(assert (=> b!117160 (=> (not res!96903) (not e!76791))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117160 (= res!96903 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!117161 () Bool)

(declare-fun res!96898 () Bool)

(declare-fun e!76792 () Bool)

(assert (=> b!117161 (=> (not res!96898) (not e!76792))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!117161 (= res!96898 (invariant!0 (currentBit!5443 thiss!1305) (currentByte!5448 thiss!1305) (size!2392 (buf!2805 (_2!5139 lt!179396)))))))

(declare-fun b!117162 () Bool)

(assert (=> b!117162 (= e!76797 e!76791)))

(declare-fun res!96902 () Bool)

(assert (=> b!117162 (=> (not res!96902) (not e!76791))))

(declare-fun lt!179404 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!117162 (= res!96902 (validate_offset_bits!1 ((_ sign_extend 32) (size!2392 (buf!2805 thiss!1305))) ((_ sign_extend 32) (currentByte!5448 thiss!1305)) ((_ sign_extend 32) (currentBit!5443 thiss!1305)) lt!179404))))

(assert (=> b!117162 (= lt!179404 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!117163 () Bool)

(declare-fun e!76795 () Bool)

(assert (=> b!117163 (= e!76795 e!76796)))

(declare-fun res!96905 () Bool)

(assert (=> b!117163 (=> (not res!96905) (not e!76796))))

(declare-fun lt!179394 () (_ BitVec 64))

(declare-fun lt!179392 () (_ BitVec 64))

(assert (=> b!117163 (= res!96905 (= lt!179394 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!179392)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!117163 (= lt!179394 (bitIndex!0 (size!2392 (buf!2805 (_2!5139 lt!179396))) (currentByte!5448 (_2!5139 lt!179396)) (currentBit!5443 (_2!5139 lt!179396))))))

(assert (=> b!117163 (= lt!179392 (bitIndex!0 (size!2392 (buf!2805 thiss!1305)) (currentByte!5448 thiss!1305) (currentBit!5443 thiss!1305)))))

(declare-fun lt!179399 () tuple2!9748)

(declare-fun b!117164 () Bool)

(assert (=> b!117164 (= e!76791 (not (or (not (= (size!2392 (buf!2805 (_2!5139 lt!179396))) (size!2392 (buf!2805 (_2!5139 lt!179399))))) (bvsge ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9750 0))(
  ( (tuple2!9751 (_1!5140 BitStream!4258) (_2!5140 (_ BitVec 64))) )
))
(declare-fun lt!179400 () tuple2!9750)

(declare-datatypes ((tuple2!9752 0))(
  ( (tuple2!9753 (_1!5141 BitStream!4258) (_2!5141 BitStream!4258)) )
))
(declare-fun lt!179403 () tuple2!9752)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4258 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9750)

(assert (=> b!117164 (= lt!179400 (readNLeastSignificantBitsLoopPure!0 (_1!5141 lt!179403) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!117164 (validate_offset_bits!1 ((_ sign_extend 32) (size!2392 (buf!2805 (_2!5139 lt!179399)))) ((_ sign_extend 32) (currentByte!5448 thiss!1305)) ((_ sign_extend 32) (currentBit!5443 thiss!1305)) lt!179404)))

(declare-fun lt!179391 () Unit!7207)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4258 array!5273 (_ BitVec 64)) Unit!7207)

(assert (=> b!117164 (= lt!179391 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2805 (_2!5139 lt!179399)) lt!179404))))

(declare-fun lt!179395 () Bool)

(declare-datatypes ((tuple2!9754 0))(
  ( (tuple2!9755 (_1!5142 BitStream!4258) (_2!5142 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!4258) tuple2!9754)

(assert (=> b!117164 (= (_2!5142 (readBitPure!0 (_1!5141 lt!179403))) lt!179395)))

(declare-fun lt!179393 () tuple2!9752)

(declare-fun reader!0 (BitStream!4258 BitStream!4258) tuple2!9752)

(assert (=> b!117164 (= lt!179393 (reader!0 (_2!5139 lt!179396) (_2!5139 lt!179399)))))

(assert (=> b!117164 (= lt!179403 (reader!0 thiss!1305 (_2!5139 lt!179399)))))

(declare-fun e!76789 () Bool)

(assert (=> b!117164 e!76789))

(declare-fun res!96906 () Bool)

(assert (=> b!117164 (=> (not res!96906) (not e!76789))))

(declare-fun lt!179402 () tuple2!9754)

(declare-fun lt!179405 () tuple2!9754)

(assert (=> b!117164 (= res!96906 (= (bitIndex!0 (size!2392 (buf!2805 (_1!5142 lt!179402))) (currentByte!5448 (_1!5142 lt!179402)) (currentBit!5443 (_1!5142 lt!179402))) (bitIndex!0 (size!2392 (buf!2805 (_1!5142 lt!179405))) (currentByte!5448 (_1!5142 lt!179405)) (currentBit!5443 (_1!5142 lt!179405)))))))

(declare-fun lt!179406 () Unit!7207)

(declare-fun lt!179401 () BitStream!4258)

(declare-fun readBitPrefixLemma!0 (BitStream!4258 BitStream!4258) Unit!7207)

(assert (=> b!117164 (= lt!179406 (readBitPrefixLemma!0 lt!179401 (_2!5139 lt!179399)))))

(assert (=> b!117164 (= lt!179405 (readBitPure!0 (BitStream!4259 (buf!2805 (_2!5139 lt!179399)) (currentByte!5448 thiss!1305) (currentBit!5443 thiss!1305))))))

(assert (=> b!117164 (= lt!179402 (readBitPure!0 lt!179401))))

(assert (=> b!117164 (= lt!179401 (BitStream!4259 (buf!2805 (_2!5139 lt!179396)) (currentByte!5448 thiss!1305) (currentBit!5443 thiss!1305)))))

(assert (=> b!117164 e!76792))

(declare-fun res!96899 () Bool)

(assert (=> b!117164 (=> (not res!96899) (not e!76792))))

(assert (=> b!117164 (= res!96899 (isPrefixOf!0 thiss!1305 (_2!5139 lt!179399)))))

(declare-fun lt!179397 () Unit!7207)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4258 BitStream!4258 BitStream!4258) Unit!7207)

(assert (=> b!117164 (= lt!179397 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5139 lt!179396) (_2!5139 lt!179399)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4258 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9748)

(assert (=> b!117164 (= lt!179399 (appendNLeastSignificantBitsLoop!0 (_2!5139 lt!179396) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!117164 e!76795))

(declare-fun res!96897 () Bool)

(assert (=> b!117164 (=> (not res!96897) (not e!76795))))

(assert (=> b!117164 (= res!96897 (= (size!2392 (buf!2805 thiss!1305)) (size!2392 (buf!2805 (_2!5139 lt!179396)))))))

(declare-fun appendBit!0 (BitStream!4258 Bool) tuple2!9748)

(assert (=> b!117164 (= lt!179396 (appendBit!0 thiss!1305 lt!179395))))

(assert (=> b!117164 (= lt!179395 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!117165 () Bool)

(declare-fun e!76794 () Bool)

(assert (=> b!117165 (= e!76796 e!76794)))

(declare-fun res!96900 () Bool)

(assert (=> b!117165 (=> (not res!96900) (not e!76794))))

(declare-fun lt!179398 () tuple2!9754)

(assert (=> b!117165 (= res!96900 (and (= (_2!5142 lt!179398) lt!179395) (= (_1!5142 lt!179398) (_2!5139 lt!179396))))))

(declare-fun readerFrom!0 (BitStream!4258 (_ BitVec 32) (_ BitVec 32)) BitStream!4258)

(assert (=> b!117165 (= lt!179398 (readBitPure!0 (readerFrom!0 (_2!5139 lt!179396) (currentBit!5443 thiss!1305) (currentByte!5448 thiss!1305))))))

(declare-fun b!117166 () Bool)

(assert (=> b!117166 (= e!76789 (= (_2!5142 lt!179402) (_2!5142 lt!179405)))))

(declare-fun b!117167 () Bool)

(assert (=> b!117167 (= e!76794 (= (bitIndex!0 (size!2392 (buf!2805 (_1!5142 lt!179398))) (currentByte!5448 (_1!5142 lt!179398)) (currentBit!5443 (_1!5142 lt!179398))) lt!179394))))

(declare-fun b!117168 () Bool)

(declare-fun array_inv!2194 (array!5273) Bool)

(assert (=> b!117168 (= e!76793 (array_inv!2194 (buf!2805 thiss!1305)))))

(declare-fun b!117169 () Bool)

(assert (=> b!117169 (= e!76792 (invariant!0 (currentBit!5443 thiss!1305) (currentByte!5448 thiss!1305) (size!2392 (buf!2805 (_2!5139 lt!179399)))))))

(assert (= (and start!23102 res!96901) b!117162))

(assert (= (and b!117162 res!96902) b!117160))

(assert (= (and b!117160 res!96903) b!117158))

(assert (= (and b!117158 res!96904) b!117164))

(assert (= (and b!117164 res!96897) b!117163))

(assert (= (and b!117163 res!96905) b!117159))

(assert (= (and b!117159 res!96896) b!117165))

(assert (= (and b!117165 res!96900) b!117167))

(assert (= (and b!117164 res!96899) b!117161))

(assert (= (and b!117161 res!96898) b!117169))

(assert (= (and b!117164 res!96906) b!117166))

(assert (= start!23102 b!117168))

(declare-fun m!175613 () Bool)

(assert (=> b!117168 m!175613))

(declare-fun m!175615 () Bool)

(assert (=> b!117167 m!175615))

(declare-fun m!175617 () Bool)

(assert (=> b!117165 m!175617))

(assert (=> b!117165 m!175617))

(declare-fun m!175619 () Bool)

(assert (=> b!117165 m!175619))

(declare-fun m!175621 () Bool)

(assert (=> start!23102 m!175621))

(declare-fun m!175623 () Bool)

(assert (=> b!117164 m!175623))

(declare-fun m!175625 () Bool)

(assert (=> b!117164 m!175625))

(declare-fun m!175627 () Bool)

(assert (=> b!117164 m!175627))

(declare-fun m!175629 () Bool)

(assert (=> b!117164 m!175629))

(declare-fun m!175631 () Bool)

(assert (=> b!117164 m!175631))

(declare-fun m!175633 () Bool)

(assert (=> b!117164 m!175633))

(declare-fun m!175635 () Bool)

(assert (=> b!117164 m!175635))

(declare-fun m!175637 () Bool)

(assert (=> b!117164 m!175637))

(declare-fun m!175639 () Bool)

(assert (=> b!117164 m!175639))

(declare-fun m!175641 () Bool)

(assert (=> b!117164 m!175641))

(declare-fun m!175643 () Bool)

(assert (=> b!117164 m!175643))

(declare-fun m!175645 () Bool)

(assert (=> b!117164 m!175645))

(declare-fun m!175647 () Bool)

(assert (=> b!117164 m!175647))

(declare-fun m!175649 () Bool)

(assert (=> b!117164 m!175649))

(declare-fun m!175651 () Bool)

(assert (=> b!117164 m!175651))

(declare-fun m!175653 () Bool)

(assert (=> b!117164 m!175653))

(declare-fun m!175655 () Bool)

(assert (=> b!117162 m!175655))

(declare-fun m!175657 () Bool)

(assert (=> b!117169 m!175657))

(declare-fun m!175659 () Bool)

(assert (=> b!117161 m!175659))

(declare-fun m!175661 () Bool)

(assert (=> b!117163 m!175661))

(declare-fun m!175663 () Bool)

(assert (=> b!117163 m!175663))

(declare-fun m!175665 () Bool)

(assert (=> b!117159 m!175665))

(declare-fun m!175667 () Bool)

(assert (=> b!117160 m!175667))

(push 1)

(assert (not b!117167))

(assert (not b!117168))

(assert (not b!117164))

(assert (not b!117160))

(assert (not b!117169))

(assert (not b!117165))

(assert (not b!117161))

(assert (not b!117159))

(assert (not start!23102))

(assert (not b!117163))

(assert (not b!117162))

(check-sat)

(pop 1)

(push 1)

(check-sat)


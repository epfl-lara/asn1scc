; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52758 () Bool)

(assert start!52758)

(declare-fun b!244285 () Bool)

(declare-fun res!204173 () Bool)

(declare-fun e!169313 () Bool)

(assert (=> b!244285 (=> (not res!204173) (not e!169313))))

(declare-datatypes ((array!13377 0))(
  ( (array!13378 (arr!6852 (Array (_ BitVec 32) (_ BitVec 8))) (size!5865 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10652 0))(
  ( (BitStream!10653 (buf!6337 array!13377) (currentByte!11715 (_ BitVec 32)) (currentBit!11710 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17825 0))(
  ( (Unit!17826) )
))
(declare-datatypes ((tuple2!20952 0))(
  ( (tuple2!20953 (_1!11398 Unit!17825) (_2!11398 BitStream!10652)) )
))
(declare-fun lt!380723 () tuple2!20952)

(declare-fun lt!380736 () tuple2!20952)

(declare-fun isPrefixOf!0 (BitStream!10652 BitStream!10652) Bool)

(assert (=> b!244285 (= res!204173 (isPrefixOf!0 (_2!11398 lt!380723) (_2!11398 lt!380736)))))

(declare-fun b!244286 () Bool)

(declare-fun e!169319 () Bool)

(declare-fun thiss!1005 () BitStream!10652)

(declare-fun array_inv!5606 (array!13377) Bool)

(assert (=> b!244286 (= e!169319 (array_inv!5606 (buf!6337 thiss!1005)))))

(declare-fun b!244287 () Bool)

(declare-datatypes ((tuple2!20954 0))(
  ( (tuple2!20955 (_1!11399 BitStream!10652) (_2!11399 Bool)) )
))
(declare-fun lt!380733 () tuple2!20954)

(declare-datatypes ((tuple2!20956 0))(
  ( (tuple2!20957 (_1!11400 BitStream!10652) (_2!11400 BitStream!10652)) )
))
(declare-fun lt!380734 () tuple2!20956)

(assert (=> b!244287 (= e!169313 (not (or (not (_2!11399 lt!380733)) (not (= (_1!11399 lt!380733) (_2!11400 lt!380734))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun checkBitsLoopPure!0 (BitStream!10652 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20954)

(assert (=> b!244287 (= lt!380733 (checkBitsLoopPure!0 (_1!11400 lt!380734) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!380720 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244287 (validate_offset_bits!1 ((_ sign_extend 32) (size!5865 (buf!6337 (_2!11398 lt!380736)))) ((_ sign_extend 32) (currentByte!11715 (_2!11398 lt!380723))) ((_ sign_extend 32) (currentBit!11710 (_2!11398 lt!380723))) lt!380720)))

(declare-fun lt!380718 () Unit!17825)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10652 array!13377 (_ BitVec 64)) Unit!17825)

(assert (=> b!244287 (= lt!380718 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11398 lt!380723) (buf!6337 (_2!11398 lt!380736)) lt!380720))))

(declare-fun reader!0 (BitStream!10652 BitStream!10652) tuple2!20956)

(assert (=> b!244287 (= lt!380734 (reader!0 (_2!11398 lt!380723) (_2!11398 lt!380736)))))

(declare-fun b!244288 () Bool)

(declare-fun e!169321 () Bool)

(declare-fun lt!380735 () tuple2!20954)

(declare-fun lt!380719 () tuple2!20954)

(assert (=> b!244288 (= e!169321 (= (_2!11399 lt!380735) (_2!11399 lt!380719)))))

(declare-fun b!244289 () Bool)

(declare-fun res!204164 () Bool)

(declare-fun e!169322 () Bool)

(assert (=> b!244289 (=> (not res!204164) (not e!169322))))

(assert (=> b!244289 (= res!204164 (bvslt from!289 nBits!297))))

(declare-fun b!244290 () Bool)

(assert (=> b!244290 (= e!169322 (not true))))

(declare-fun lt!380729 () tuple2!20954)

(declare-fun lt!380732 () tuple2!20956)

(assert (=> b!244290 (= lt!380729 (checkBitsLoopPure!0 (_1!11400 lt!380732) nBits!297 bit!26 from!289))))

(assert (=> b!244290 (validate_offset_bits!1 ((_ sign_extend 32) (size!5865 (buf!6337 (_2!11398 lt!380736)))) ((_ sign_extend 32) (currentByte!11715 thiss!1005)) ((_ sign_extend 32) (currentBit!11710 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380726 () Unit!17825)

(assert (=> b!244290 (= lt!380726 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6337 (_2!11398 lt!380736)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10652) tuple2!20954)

(assert (=> b!244290 (= (_2!11399 (readBitPure!0 (_1!11400 lt!380732))) bit!26)))

(declare-fun lt!380724 () tuple2!20956)

(assert (=> b!244290 (= lt!380724 (reader!0 (_2!11398 lt!380723) (_2!11398 lt!380736)))))

(assert (=> b!244290 (= lt!380732 (reader!0 thiss!1005 (_2!11398 lt!380736)))))

(assert (=> b!244290 e!169321))

(declare-fun res!204165 () Bool)

(assert (=> b!244290 (=> (not res!204165) (not e!169321))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244290 (= res!204165 (= (bitIndex!0 (size!5865 (buf!6337 (_1!11399 lt!380735))) (currentByte!11715 (_1!11399 lt!380735)) (currentBit!11710 (_1!11399 lt!380735))) (bitIndex!0 (size!5865 (buf!6337 (_1!11399 lt!380719))) (currentByte!11715 (_1!11399 lt!380719)) (currentBit!11710 (_1!11399 lt!380719)))))))

(declare-fun lt!380728 () Unit!17825)

(declare-fun lt!380722 () BitStream!10652)

(declare-fun readBitPrefixLemma!0 (BitStream!10652 BitStream!10652) Unit!17825)

(assert (=> b!244290 (= lt!380728 (readBitPrefixLemma!0 lt!380722 (_2!11398 lt!380736)))))

(assert (=> b!244290 (= lt!380719 (readBitPure!0 (BitStream!10653 (buf!6337 (_2!11398 lt!380736)) (currentByte!11715 thiss!1005) (currentBit!11710 thiss!1005))))))

(assert (=> b!244290 (= lt!380735 (readBitPure!0 lt!380722))))

(assert (=> b!244290 (= lt!380722 (BitStream!10653 (buf!6337 (_2!11398 lt!380723)) (currentByte!11715 thiss!1005) (currentBit!11710 thiss!1005)))))

(declare-fun e!169320 () Bool)

(assert (=> b!244290 e!169320))

(declare-fun res!204169 () Bool)

(assert (=> b!244290 (=> (not res!204169) (not e!169320))))

(assert (=> b!244290 (= res!204169 (isPrefixOf!0 thiss!1005 (_2!11398 lt!380736)))))

(declare-fun lt!380721 () Unit!17825)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10652 BitStream!10652 BitStream!10652) Unit!17825)

(assert (=> b!244290 (= lt!380721 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11398 lt!380723) (_2!11398 lt!380736)))))

(declare-fun e!169317 () Bool)

(assert (=> b!244290 e!169317))

(declare-fun res!204172 () Bool)

(assert (=> b!244290 (=> (not res!204172) (not e!169317))))

(assert (=> b!244290 (= res!204172 (= (size!5865 (buf!6337 (_2!11398 lt!380723))) (size!5865 (buf!6337 (_2!11398 lt!380736)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10652 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20952)

(assert (=> b!244290 (= lt!380736 (appendNBitsLoop!0 (_2!11398 lt!380723) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244290 (validate_offset_bits!1 ((_ sign_extend 32) (size!5865 (buf!6337 (_2!11398 lt!380723)))) ((_ sign_extend 32) (currentByte!11715 (_2!11398 lt!380723))) ((_ sign_extend 32) (currentBit!11710 (_2!11398 lt!380723))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380731 () Unit!17825)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10652 BitStream!10652 (_ BitVec 64) (_ BitVec 64)) Unit!17825)

(assert (=> b!244290 (= lt!380731 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11398 lt!380723) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169315 () Bool)

(assert (=> b!244290 e!169315))

(declare-fun res!204162 () Bool)

(assert (=> b!244290 (=> (not res!204162) (not e!169315))))

(assert (=> b!244290 (= res!204162 (= (size!5865 (buf!6337 thiss!1005)) (size!5865 (buf!6337 (_2!11398 lt!380723)))))))

(declare-fun appendBit!0 (BitStream!10652 Bool) tuple2!20952)

(assert (=> b!244290 (= lt!380723 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244291 () Bool)

(declare-fun e!169314 () Bool)

(assert (=> b!244291 (= e!169315 e!169314)))

(declare-fun res!204167 () Bool)

(assert (=> b!244291 (=> (not res!204167) (not e!169314))))

(declare-fun lt!380727 () (_ BitVec 64))

(declare-fun lt!380730 () (_ BitVec 64))

(assert (=> b!244291 (= res!204167 (= lt!380727 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380730)))))

(assert (=> b!244291 (= lt!380727 (bitIndex!0 (size!5865 (buf!6337 (_2!11398 lt!380723))) (currentByte!11715 (_2!11398 lt!380723)) (currentBit!11710 (_2!11398 lt!380723))))))

(assert (=> b!244291 (= lt!380730 (bitIndex!0 (size!5865 (buf!6337 thiss!1005)) (currentByte!11715 thiss!1005) (currentBit!11710 thiss!1005)))))

(declare-fun b!244292 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244292 (= e!169320 (invariant!0 (currentBit!11710 thiss!1005) (currentByte!11715 thiss!1005) (size!5865 (buf!6337 (_2!11398 lt!380736)))))))

(declare-fun b!244293 () Bool)

(declare-fun res!204168 () Bool)

(assert (=> b!244293 (=> (not res!204168) (not e!169314))))

(assert (=> b!244293 (= res!204168 (isPrefixOf!0 thiss!1005 (_2!11398 lt!380723)))))

(declare-fun res!204171 () Bool)

(assert (=> start!52758 (=> (not res!204171) (not e!169322))))

(assert (=> start!52758 (= res!204171 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52758 e!169322))

(assert (=> start!52758 true))

(declare-fun inv!12 (BitStream!10652) Bool)

(assert (=> start!52758 (and (inv!12 thiss!1005) e!169319)))

(declare-fun b!244294 () Bool)

(declare-fun res!204174 () Bool)

(assert (=> b!244294 (=> (not res!204174) (not e!169322))))

(assert (=> b!244294 (= res!204174 (validate_offset_bits!1 ((_ sign_extend 32) (size!5865 (buf!6337 thiss!1005))) ((_ sign_extend 32) (currentByte!11715 thiss!1005)) ((_ sign_extend 32) (currentBit!11710 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244295 () Bool)

(declare-fun e!169316 () Bool)

(declare-fun lt!380725 () tuple2!20954)

(assert (=> b!244295 (= e!169316 (= (bitIndex!0 (size!5865 (buf!6337 (_1!11399 lt!380725))) (currentByte!11715 (_1!11399 lt!380725)) (currentBit!11710 (_1!11399 lt!380725))) lt!380727))))

(declare-fun b!244296 () Bool)

(declare-fun res!204170 () Bool)

(assert (=> b!244296 (=> (not res!204170) (not e!169320))))

(assert (=> b!244296 (= res!204170 (invariant!0 (currentBit!11710 thiss!1005) (currentByte!11715 thiss!1005) (size!5865 (buf!6337 (_2!11398 lt!380723)))))))

(declare-fun b!244297 () Bool)

(assert (=> b!244297 (= e!169314 e!169316)))

(declare-fun res!204163 () Bool)

(assert (=> b!244297 (=> (not res!204163) (not e!169316))))

(assert (=> b!244297 (= res!204163 (and (= (_2!11399 lt!380725) bit!26) (= (_1!11399 lt!380725) (_2!11398 lt!380723))))))

(declare-fun readerFrom!0 (BitStream!10652 (_ BitVec 32) (_ BitVec 32)) BitStream!10652)

(assert (=> b!244297 (= lt!380725 (readBitPure!0 (readerFrom!0 (_2!11398 lt!380723) (currentBit!11710 thiss!1005) (currentByte!11715 thiss!1005))))))

(declare-fun b!244298 () Bool)

(assert (=> b!244298 (= e!169317 e!169313)))

(declare-fun res!204166 () Bool)

(assert (=> b!244298 (=> (not res!204166) (not e!169313))))

(assert (=> b!244298 (= res!204166 (= (bitIndex!0 (size!5865 (buf!6337 (_2!11398 lt!380736))) (currentByte!11715 (_2!11398 lt!380736)) (currentBit!11710 (_2!11398 lt!380736))) (bvadd (bitIndex!0 (size!5865 (buf!6337 (_2!11398 lt!380723))) (currentByte!11715 (_2!11398 lt!380723)) (currentBit!11710 (_2!11398 lt!380723))) lt!380720)))))

(assert (=> b!244298 (= lt!380720 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (= (and start!52758 res!204171) b!244294))

(assert (= (and b!244294 res!204174) b!244289))

(assert (= (and b!244289 res!204164) b!244290))

(assert (= (and b!244290 res!204162) b!244291))

(assert (= (and b!244291 res!204167) b!244293))

(assert (= (and b!244293 res!204168) b!244297))

(assert (= (and b!244297 res!204163) b!244295))

(assert (= (and b!244290 res!204172) b!244298))

(assert (= (and b!244298 res!204166) b!244285))

(assert (= (and b!244285 res!204173) b!244287))

(assert (= (and b!244290 res!204169) b!244296))

(assert (= (and b!244296 res!204170) b!244292))

(assert (= (and b!244290 res!204165) b!244288))

(assert (= start!52758 b!244286))

(declare-fun m!368153 () Bool)

(assert (=> b!244290 m!368153))

(declare-fun m!368155 () Bool)

(assert (=> b!244290 m!368155))

(declare-fun m!368157 () Bool)

(assert (=> b!244290 m!368157))

(declare-fun m!368159 () Bool)

(assert (=> b!244290 m!368159))

(declare-fun m!368161 () Bool)

(assert (=> b!244290 m!368161))

(declare-fun m!368163 () Bool)

(assert (=> b!244290 m!368163))

(declare-fun m!368165 () Bool)

(assert (=> b!244290 m!368165))

(declare-fun m!368167 () Bool)

(assert (=> b!244290 m!368167))

(declare-fun m!368169 () Bool)

(assert (=> b!244290 m!368169))

(declare-fun m!368171 () Bool)

(assert (=> b!244290 m!368171))

(declare-fun m!368173 () Bool)

(assert (=> b!244290 m!368173))

(declare-fun m!368175 () Bool)

(assert (=> b!244290 m!368175))

(declare-fun m!368177 () Bool)

(assert (=> b!244290 m!368177))

(declare-fun m!368179 () Bool)

(assert (=> b!244290 m!368179))

(declare-fun m!368181 () Bool)

(assert (=> b!244290 m!368181))

(declare-fun m!368183 () Bool)

(assert (=> b!244290 m!368183))

(declare-fun m!368185 () Bool)

(assert (=> b!244290 m!368185))

(declare-fun m!368187 () Bool)

(assert (=> b!244293 m!368187))

(declare-fun m!368189 () Bool)

(assert (=> b!244298 m!368189))

(declare-fun m!368191 () Bool)

(assert (=> b!244298 m!368191))

(declare-fun m!368193 () Bool)

(assert (=> b!244297 m!368193))

(assert (=> b!244297 m!368193))

(declare-fun m!368195 () Bool)

(assert (=> b!244297 m!368195))

(declare-fun m!368197 () Bool)

(assert (=> b!244295 m!368197))

(declare-fun m!368199 () Bool)

(assert (=> b!244294 m!368199))

(declare-fun m!368201 () Bool)

(assert (=> b!244287 m!368201))

(declare-fun m!368203 () Bool)

(assert (=> b!244287 m!368203))

(declare-fun m!368205 () Bool)

(assert (=> b!244287 m!368205))

(assert (=> b!244287 m!368157))

(declare-fun m!368207 () Bool)

(assert (=> b!244292 m!368207))

(declare-fun m!368209 () Bool)

(assert (=> b!244285 m!368209))

(declare-fun m!368211 () Bool)

(assert (=> b!244296 m!368211))

(declare-fun m!368213 () Bool)

(assert (=> b!244286 m!368213))

(declare-fun m!368215 () Bool)

(assert (=> start!52758 m!368215))

(assert (=> b!244291 m!368191))

(declare-fun m!368217 () Bool)

(assert (=> b!244291 m!368217))

(push 1)

(assert (not b!244285))

(assert (not start!52758))

(assert (not b!244290))

(assert (not b!244287))

(assert (not b!244293))

(assert (not b!244296))

(assert (not b!244295))

(assert (not b!244298))

(assert (not b!244297))

(assert (not b!244291))

(assert (not b!244286))

(assert (not b!244292))

(assert (not b!244294))


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52622 () Bool)

(assert start!52622)

(declare-fun b!243190 () Bool)

(declare-fun res!203158 () Bool)

(declare-fun e!168577 () Bool)

(assert (=> b!243190 (=> (not res!203158) (not e!168577))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13334 0))(
  ( (array!13335 (arr!6832 (Array (_ BitVec 32) (_ BitVec 8))) (size!5845 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10612 0))(
  ( (BitStream!10613 (buf!6314 array!13334) (currentByte!11686 (_ BitVec 32)) (currentBit!11681 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10612)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243190 (= res!203158 (validate_offset_bits!1 ((_ sign_extend 32) (size!5845 (buf!6314 thiss!1005))) ((_ sign_extend 32) (currentByte!11686 thiss!1005)) ((_ sign_extend 32) (currentBit!11681 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243191 () Bool)

(declare-fun e!168575 () Bool)

(declare-datatypes ((tuple2!20826 0))(
  ( (tuple2!20827 (_1!11335 BitStream!10612) (_2!11335 Bool)) )
))
(declare-fun lt!379046 () tuple2!20826)

(declare-fun lt!379050 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243191 (= e!168575 (= (bitIndex!0 (size!5845 (buf!6314 (_1!11335 lt!379046))) (currentByte!11686 (_1!11335 lt!379046)) (currentBit!11681 (_1!11335 lt!379046))) lt!379050))))

(declare-fun b!243192 () Bool)

(declare-fun res!203163 () Bool)

(declare-fun e!168578 () Bool)

(assert (=> b!243192 (=> (not res!203163) (not e!168578))))

(declare-datatypes ((Unit!17779 0))(
  ( (Unit!17780) )
))
(declare-datatypes ((tuple2!20828 0))(
  ( (tuple2!20829 (_1!11336 Unit!17779) (_2!11336 BitStream!10612)) )
))
(declare-fun lt!379049 () tuple2!20828)

(declare-fun isPrefixOf!0 (BitStream!10612 BitStream!10612) Bool)

(assert (=> b!243192 (= res!203163 (isPrefixOf!0 thiss!1005 (_2!11336 lt!379049)))))

(declare-fun b!243193 () Bool)

(declare-fun e!168580 () Bool)

(declare-fun array_inv!5586 (array!13334) Bool)

(assert (=> b!243193 (= e!168580 (array_inv!5586 (buf!6314 thiss!1005)))))

(declare-fun b!243194 () Bool)

(declare-fun e!168572 () Bool)

(declare-fun lt!379041 () tuple2!20826)

(declare-fun lt!379045 () tuple2!20826)

(assert (=> b!243194 (= e!168572 (= (_2!11335 lt!379041) (_2!11335 lt!379045)))))

(declare-fun b!243195 () Bool)

(declare-fun e!168576 () Bool)

(declare-fun lt!379044 () tuple2!20826)

(declare-datatypes ((tuple2!20830 0))(
  ( (tuple2!20831 (_1!11337 BitStream!10612) (_2!11337 BitStream!10612)) )
))
(declare-fun lt!379048 () tuple2!20830)

(assert (=> b!243195 (= e!168576 (not (or (not (_2!11335 lt!379044)) (not (= (_1!11335 lt!379044) (_2!11337 lt!379048))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10612 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20826)

(assert (=> b!243195 (= lt!379044 (checkBitsLoopPure!0 (_1!11337 lt!379048) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!379038 () tuple2!20828)

(declare-fun lt!379040 () (_ BitVec 64))

(assert (=> b!243195 (validate_offset_bits!1 ((_ sign_extend 32) (size!5845 (buf!6314 (_2!11336 lt!379038)))) ((_ sign_extend 32) (currentByte!11686 (_2!11336 lt!379049))) ((_ sign_extend 32) (currentBit!11681 (_2!11336 lt!379049))) lt!379040)))

(declare-fun lt!379043 () Unit!17779)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10612 array!13334 (_ BitVec 64)) Unit!17779)

(assert (=> b!243195 (= lt!379043 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11336 lt!379049) (buf!6314 (_2!11336 lt!379038)) lt!379040))))

(declare-fun reader!0 (BitStream!10612 BitStream!10612) tuple2!20830)

(assert (=> b!243195 (= lt!379048 (reader!0 (_2!11336 lt!379049) (_2!11336 lt!379038)))))

(declare-fun b!243196 () Bool)

(declare-fun res!203156 () Bool)

(declare-fun e!168574 () Bool)

(assert (=> b!243196 (=> (not res!203156) (not e!168574))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243196 (= res!203156 (invariant!0 (currentBit!11681 thiss!1005) (currentByte!11686 thiss!1005) (size!5845 (buf!6314 (_2!11336 lt!379049)))))))

(declare-fun b!243198 () Bool)

(declare-fun res!203152 () Bool)

(assert (=> b!243198 (=> (not res!203152) (not e!168576))))

(assert (=> b!243198 (= res!203152 (isPrefixOf!0 (_2!11336 lt!379049) (_2!11336 lt!379038)))))

(declare-fun b!243199 () Bool)

(assert (=> b!243199 (= e!168578 e!168575)))

(declare-fun res!203162 () Bool)

(assert (=> b!243199 (=> (not res!203162) (not e!168575))))

(assert (=> b!243199 (= res!203162 (and (= (_2!11335 lt!379046) bit!26) (= (_1!11335 lt!379046) (_2!11336 lt!379049))))))

(declare-fun readBitPure!0 (BitStream!10612) tuple2!20826)

(declare-fun readerFrom!0 (BitStream!10612 (_ BitVec 32) (_ BitVec 32)) BitStream!10612)

(assert (=> b!243199 (= lt!379046 (readBitPure!0 (readerFrom!0 (_2!11336 lt!379049) (currentBit!11681 thiss!1005) (currentByte!11686 thiss!1005))))))

(declare-fun b!243200 () Bool)

(declare-fun e!168579 () Bool)

(assert (=> b!243200 (= e!168579 e!168576)))

(declare-fun res!203154 () Bool)

(assert (=> b!243200 (=> (not res!203154) (not e!168576))))

(assert (=> b!243200 (= res!203154 (= (bitIndex!0 (size!5845 (buf!6314 (_2!11336 lt!379038))) (currentByte!11686 (_2!11336 lt!379038)) (currentBit!11681 (_2!11336 lt!379038))) (bvadd (bitIndex!0 (size!5845 (buf!6314 (_2!11336 lt!379049))) (currentByte!11686 (_2!11336 lt!379049)) (currentBit!11681 (_2!11336 lt!379049))) lt!379040)))))

(assert (=> b!243200 (= lt!379040 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!243201 () Bool)

(declare-fun e!168573 () Bool)

(assert (=> b!243201 (= e!168573 e!168578)))

(declare-fun res!203151 () Bool)

(assert (=> b!243201 (=> (not res!203151) (not e!168578))))

(declare-fun lt!379037 () (_ BitVec 64))

(assert (=> b!243201 (= res!203151 (= lt!379050 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!379037)))))

(assert (=> b!243201 (= lt!379050 (bitIndex!0 (size!5845 (buf!6314 (_2!11336 lt!379049))) (currentByte!11686 (_2!11336 lt!379049)) (currentBit!11681 (_2!11336 lt!379049))))))

(assert (=> b!243201 (= lt!379037 (bitIndex!0 (size!5845 (buf!6314 thiss!1005)) (currentByte!11686 thiss!1005) (currentBit!11681 thiss!1005)))))

(declare-fun res!203153 () Bool)

(assert (=> start!52622 (=> (not res!203153) (not e!168577))))

(assert (=> start!52622 (= res!203153 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52622 e!168577))

(assert (=> start!52622 true))

(declare-fun inv!12 (BitStream!10612) Bool)

(assert (=> start!52622 (and (inv!12 thiss!1005) e!168580)))

(declare-fun b!243197 () Bool)

(assert (=> b!243197 (= e!168577 (not true))))

(declare-fun lt!379035 () tuple2!20830)

(assert (=> b!243197 (= (_2!11335 (readBitPure!0 (_1!11337 lt!379035))) bit!26)))

(declare-fun lt!379039 () tuple2!20830)

(assert (=> b!243197 (= lt!379039 (reader!0 (_2!11336 lt!379049) (_2!11336 lt!379038)))))

(assert (=> b!243197 (= lt!379035 (reader!0 thiss!1005 (_2!11336 lt!379038)))))

(assert (=> b!243197 e!168572))

(declare-fun res!203161 () Bool)

(assert (=> b!243197 (=> (not res!203161) (not e!168572))))

(assert (=> b!243197 (= res!203161 (= (bitIndex!0 (size!5845 (buf!6314 (_1!11335 lt!379041))) (currentByte!11686 (_1!11335 lt!379041)) (currentBit!11681 (_1!11335 lt!379041))) (bitIndex!0 (size!5845 (buf!6314 (_1!11335 lt!379045))) (currentByte!11686 (_1!11335 lt!379045)) (currentBit!11681 (_1!11335 lt!379045)))))))

(declare-fun lt!379036 () Unit!17779)

(declare-fun lt!379047 () BitStream!10612)

(declare-fun readBitPrefixLemma!0 (BitStream!10612 BitStream!10612) Unit!17779)

(assert (=> b!243197 (= lt!379036 (readBitPrefixLemma!0 lt!379047 (_2!11336 lt!379038)))))

(assert (=> b!243197 (= lt!379045 (readBitPure!0 (BitStream!10613 (buf!6314 (_2!11336 lt!379038)) (currentByte!11686 thiss!1005) (currentBit!11681 thiss!1005))))))

(assert (=> b!243197 (= lt!379041 (readBitPure!0 lt!379047))))

(assert (=> b!243197 (= lt!379047 (BitStream!10613 (buf!6314 (_2!11336 lt!379049)) (currentByte!11686 thiss!1005) (currentBit!11681 thiss!1005)))))

(assert (=> b!243197 e!168574))

(declare-fun res!203155 () Bool)

(assert (=> b!243197 (=> (not res!203155) (not e!168574))))

(assert (=> b!243197 (= res!203155 (isPrefixOf!0 thiss!1005 (_2!11336 lt!379038)))))

(declare-fun lt!379042 () Unit!17779)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10612 BitStream!10612 BitStream!10612) Unit!17779)

(assert (=> b!243197 (= lt!379042 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11336 lt!379049) (_2!11336 lt!379038)))))

(assert (=> b!243197 e!168579))

(declare-fun res!203159 () Bool)

(assert (=> b!243197 (=> (not res!203159) (not e!168579))))

(assert (=> b!243197 (= res!203159 (= (size!5845 (buf!6314 (_2!11336 lt!379049))) (size!5845 (buf!6314 (_2!11336 lt!379038)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10612 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20828)

(assert (=> b!243197 (= lt!379038 (appendNBitsLoop!0 (_2!11336 lt!379049) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243197 (validate_offset_bits!1 ((_ sign_extend 32) (size!5845 (buf!6314 (_2!11336 lt!379049)))) ((_ sign_extend 32) (currentByte!11686 (_2!11336 lt!379049))) ((_ sign_extend 32) (currentBit!11681 (_2!11336 lt!379049))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!379034 () Unit!17779)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10612 BitStream!10612 (_ BitVec 64) (_ BitVec 64)) Unit!17779)

(assert (=> b!243197 (= lt!379034 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11336 lt!379049) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!243197 e!168573))

(declare-fun res!203157 () Bool)

(assert (=> b!243197 (=> (not res!203157) (not e!168573))))

(assert (=> b!243197 (= res!203157 (= (size!5845 (buf!6314 thiss!1005)) (size!5845 (buf!6314 (_2!11336 lt!379049)))))))

(declare-fun appendBit!0 (BitStream!10612 Bool) tuple2!20828)

(assert (=> b!243197 (= lt!379049 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243202 () Bool)

(assert (=> b!243202 (= e!168574 (invariant!0 (currentBit!11681 thiss!1005) (currentByte!11686 thiss!1005) (size!5845 (buf!6314 (_2!11336 lt!379038)))))))

(declare-fun b!243203 () Bool)

(declare-fun res!203160 () Bool)

(assert (=> b!243203 (=> (not res!203160) (not e!168577))))

(assert (=> b!243203 (= res!203160 (bvslt from!289 nBits!297))))

(assert (= (and start!52622 res!203153) b!243190))

(assert (= (and b!243190 res!203158) b!243203))

(assert (= (and b!243203 res!203160) b!243197))

(assert (= (and b!243197 res!203157) b!243201))

(assert (= (and b!243201 res!203151) b!243192))

(assert (= (and b!243192 res!203163) b!243199))

(assert (= (and b!243199 res!203162) b!243191))

(assert (= (and b!243197 res!203159) b!243200))

(assert (= (and b!243200 res!203154) b!243198))

(assert (= (and b!243198 res!203152) b!243195))

(assert (= (and b!243197 res!203155) b!243196))

(assert (= (and b!243196 res!203156) b!243202))

(assert (= (and b!243197 res!203161) b!243194))

(assert (= start!52622 b!243193))

(declare-fun m!366413 () Bool)

(assert (=> start!52622 m!366413))

(declare-fun m!366415 () Bool)

(assert (=> b!243192 m!366415))

(declare-fun m!366417 () Bool)

(assert (=> b!243201 m!366417))

(declare-fun m!366419 () Bool)

(assert (=> b!243201 m!366419))

(declare-fun m!366421 () Bool)

(assert (=> b!243198 m!366421))

(declare-fun m!366423 () Bool)

(assert (=> b!243202 m!366423))

(declare-fun m!366425 () Bool)

(assert (=> b!243196 m!366425))

(declare-fun m!366427 () Bool)

(assert (=> b!243193 m!366427))

(declare-fun m!366429 () Bool)

(assert (=> b!243199 m!366429))

(assert (=> b!243199 m!366429))

(declare-fun m!366431 () Bool)

(assert (=> b!243199 m!366431))

(declare-fun m!366433 () Bool)

(assert (=> b!243197 m!366433))

(declare-fun m!366435 () Bool)

(assert (=> b!243197 m!366435))

(declare-fun m!366437 () Bool)

(assert (=> b!243197 m!366437))

(declare-fun m!366439 () Bool)

(assert (=> b!243197 m!366439))

(declare-fun m!366441 () Bool)

(assert (=> b!243197 m!366441))

(declare-fun m!366443 () Bool)

(assert (=> b!243197 m!366443))

(declare-fun m!366445 () Bool)

(assert (=> b!243197 m!366445))

(declare-fun m!366447 () Bool)

(assert (=> b!243197 m!366447))

(declare-fun m!366449 () Bool)

(assert (=> b!243197 m!366449))

(declare-fun m!366451 () Bool)

(assert (=> b!243197 m!366451))

(declare-fun m!366453 () Bool)

(assert (=> b!243197 m!366453))

(declare-fun m!366455 () Bool)

(assert (=> b!243197 m!366455))

(declare-fun m!366457 () Bool)

(assert (=> b!243197 m!366457))

(declare-fun m!366459 () Bool)

(assert (=> b!243197 m!366459))

(declare-fun m!366461 () Bool)

(assert (=> b!243190 m!366461))

(declare-fun m!366463 () Bool)

(assert (=> b!243195 m!366463))

(declare-fun m!366465 () Bool)

(assert (=> b!243195 m!366465))

(declare-fun m!366467 () Bool)

(assert (=> b!243195 m!366467))

(assert (=> b!243195 m!366447))

(declare-fun m!366469 () Bool)

(assert (=> b!243191 m!366469))

(declare-fun m!366471 () Bool)

(assert (=> b!243200 m!366471))

(assert (=> b!243200 m!366417))

(push 1)

(assert (not b!243199))

(assert (not b!243193))

(assert (not start!52622))

(assert (not b!243200))

(assert (not b!243190))

(assert (not b!243202))

(assert (not b!243191))

(assert (not b!243192))

(assert (not b!243198))

(assert (not b!243197))

(assert (not b!243196))

(assert (not b!243195))

(assert (not b!243201))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


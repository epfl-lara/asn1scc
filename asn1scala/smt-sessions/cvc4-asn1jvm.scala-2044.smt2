; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52196 () Bool)

(assert start!52196)

(declare-fun b!240252 () Bool)

(declare-fun e!166531 () Bool)

(declare-datatypes ((array!13127 0))(
  ( (array!13128 (arr!6735 (Array (_ BitVec 32) (_ BitVec 8))) (size!5748 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10418 0))(
  ( (BitStream!10419 (buf!6208 array!13127) (currentByte!11562 (_ BitVec 32)) (currentBit!11557 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20340 0))(
  ( (tuple2!20341 (_1!11092 BitStream!10418) (_2!11092 Bool)) )
))
(declare-fun lt!375276 () tuple2!20340)

(declare-datatypes ((tuple2!20342 0))(
  ( (tuple2!20343 (_1!11093 BitStream!10418) (_2!11093 BitStream!10418)) )
))
(declare-fun lt!375277 () tuple2!20342)

(assert (=> b!240252 (= e!166531 (not (or (not (_2!11092 lt!375276)) (not (= (_1!11092 lt!375276) (_2!11093 lt!375277))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10418 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20340)

(assert (=> b!240252 (= lt!375276 (checkBitsLoopPure!0 (_1!11093 lt!375277) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17597 0))(
  ( (Unit!17598) )
))
(declare-datatypes ((tuple2!20344 0))(
  ( (tuple2!20345 (_1!11094 Unit!17597) (_2!11094 BitStream!10418)) )
))
(declare-fun lt!375274 () tuple2!20344)

(declare-fun thiss!982 () BitStream!10418)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240252 (validate_offset_bits!1 ((_ sign_extend 32) (size!5748 (buf!6208 (_2!11094 lt!375274)))) ((_ sign_extend 32) (currentByte!11562 thiss!982)) ((_ sign_extend 32) (currentBit!11557 thiss!982)) nBits!288)))

(declare-fun lt!375278 () Unit!17597)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10418 array!13127 (_ BitVec 64)) Unit!17597)

(assert (=> b!240252 (= lt!375278 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6208 (_2!11094 lt!375274)) nBits!288))))

(declare-fun reader!0 (BitStream!10418 BitStream!10418) tuple2!20342)

(assert (=> b!240252 (= lt!375277 (reader!0 thiss!982 (_2!11094 lt!375274)))))

(declare-fun b!240253 () Bool)

(declare-fun res!200564 () Bool)

(assert (=> b!240253 (=> (not res!200564) (not e!166531))))

(declare-fun isPrefixOf!0 (BitStream!10418 BitStream!10418) Bool)

(assert (=> b!240253 (= res!200564 (isPrefixOf!0 thiss!982 (_2!11094 lt!375274)))))

(declare-fun res!200568 () Bool)

(declare-fun e!166529 () Bool)

(assert (=> start!52196 (=> (not res!200568) (not e!166529))))

(assert (=> start!52196 (= res!200568 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52196 e!166529))

(assert (=> start!52196 true))

(declare-fun e!166532 () Bool)

(declare-fun inv!12 (BitStream!10418) Bool)

(assert (=> start!52196 (and (inv!12 thiss!982) e!166532)))

(declare-fun b!240254 () Bool)

(assert (=> b!240254 (= e!166529 (not true))))

(declare-fun lt!375275 () Bool)

(assert (=> b!240254 (= lt!375275 (isPrefixOf!0 thiss!982 (_2!11094 lt!375274)))))

(declare-fun lt!375279 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240254 (= lt!375279 (bitIndex!0 (size!5748 (buf!6208 (_2!11094 lt!375274))) (currentByte!11562 (_2!11094 lt!375274)) (currentBit!11557 (_2!11094 lt!375274))))))

(declare-fun lt!375273 () (_ BitVec 64))

(assert (=> b!240254 (= lt!375273 (bitIndex!0 (size!5748 (buf!6208 thiss!982)) (currentByte!11562 thiss!982) (currentBit!11557 thiss!982)))))

(assert (=> b!240254 e!166531))

(declare-fun res!200565 () Bool)

(assert (=> b!240254 (=> (not res!200565) (not e!166531))))

(assert (=> b!240254 (= res!200565 (= (size!5748 (buf!6208 thiss!982)) (size!5748 (buf!6208 (_2!11094 lt!375274)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10418 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20344)

(assert (=> b!240254 (= lt!375274 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240255 () Bool)

(declare-fun res!200567 () Bool)

(assert (=> b!240255 (=> (not res!200567) (not e!166531))))

(assert (=> b!240255 (= res!200567 (= (bitIndex!0 (size!5748 (buf!6208 (_2!11094 lt!375274))) (currentByte!11562 (_2!11094 lt!375274)) (currentBit!11557 (_2!11094 lt!375274))) (bvadd (bitIndex!0 (size!5748 (buf!6208 thiss!982)) (currentByte!11562 thiss!982) (currentBit!11557 thiss!982)) nBits!288)))))

(declare-fun b!240256 () Bool)

(declare-fun res!200566 () Bool)

(assert (=> b!240256 (=> (not res!200566) (not e!166529))))

(assert (=> b!240256 (= res!200566 (validate_offset_bits!1 ((_ sign_extend 32) (size!5748 (buf!6208 thiss!982))) ((_ sign_extend 32) (currentByte!11562 thiss!982)) ((_ sign_extend 32) (currentBit!11557 thiss!982)) nBits!288))))

(declare-fun b!240257 () Bool)

(declare-fun array_inv!5489 (array!13127) Bool)

(assert (=> b!240257 (= e!166532 (array_inv!5489 (buf!6208 thiss!982)))))

(assert (= (and start!52196 res!200568) b!240256))

(assert (= (and b!240256 res!200566) b!240254))

(assert (= (and b!240254 res!200565) b!240255))

(assert (= (and b!240255 res!200567) b!240253))

(assert (= (and b!240253 res!200564) b!240252))

(assert (= start!52196 b!240257))

(declare-fun m!362705 () Bool)

(assert (=> b!240257 m!362705))

(declare-fun m!362707 () Bool)

(assert (=> b!240256 m!362707))

(declare-fun m!362709 () Bool)

(assert (=> b!240254 m!362709))

(declare-fun m!362711 () Bool)

(assert (=> b!240254 m!362711))

(declare-fun m!362713 () Bool)

(assert (=> b!240254 m!362713))

(declare-fun m!362715 () Bool)

(assert (=> b!240254 m!362715))

(assert (=> b!240253 m!362709))

(declare-fun m!362717 () Bool)

(assert (=> start!52196 m!362717))

(assert (=> b!240255 m!362711))

(assert (=> b!240255 m!362713))

(declare-fun m!362719 () Bool)

(assert (=> b!240252 m!362719))

(declare-fun m!362721 () Bool)

(assert (=> b!240252 m!362721))

(declare-fun m!362723 () Bool)

(assert (=> b!240252 m!362723))

(declare-fun m!362725 () Bool)

(assert (=> b!240252 m!362725))

(push 1)

(assert (not b!240253))

(assert (not b!240252))

(assert (not b!240257))

(assert (not b!240254))

(assert (not start!52196))

(assert (not b!240256))

(assert (not b!240255))

(check-sat)

(pop 1)

(push 1)

(check-sat)


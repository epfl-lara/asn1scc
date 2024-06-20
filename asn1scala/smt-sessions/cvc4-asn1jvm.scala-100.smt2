; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2364 () Bool)

(assert start!2364)

(declare-fun res!10982 () Bool)

(declare-fun e!6813 () Bool)

(assert (=> start!2364 (=> (not res!10982) (not e!6813))))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((array!655 0))(
  ( (array!656 (arr!702 (Array (_ BitVec 32) (_ BitVec 8))) (size!282 (_ BitVec 32))) )
))
(declare-fun srcBuffer!6 () array!655)

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> start!2364 (= res!10982 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!282 srcBuffer!6))))))))

(assert (=> start!2364 e!6813))

(assert (=> start!2364 true))

(declare-fun array_inv!274 (array!655) Bool)

(assert (=> start!2364 (array_inv!274 srcBuffer!6)))

(declare-datatypes ((BitStream!530 0))(
  ( (BitStream!531 (buf!627 array!655) (currentByte!1699 (_ BitVec 32)) (currentBit!1694 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!530)

(declare-fun e!6815 () Bool)

(declare-fun inv!12 (BitStream!530) Bool)

(assert (=> start!2364 (and (inv!12 thiss!1486) e!6815)))

(declare-fun b!11149 () Bool)

(declare-fun e!6810 () Bool)

(assert (=> b!11149 (= e!6813 e!6810)))

(declare-fun res!10979 () Bool)

(assert (=> b!11149 (=> (not res!10979) (not e!6810))))

(declare-datatypes ((Unit!960 0))(
  ( (Unit!961) )
))
(declare-datatypes ((tuple2!1366 0))(
  ( (tuple2!1367 (_1!729 Unit!960) (_2!729 BitStream!530)) )
))
(declare-fun lt!17612 () tuple2!1366)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!11149 (= res!10979 (invariant!0 (currentBit!1694 (_2!729 lt!17612)) (currentByte!1699 (_2!729 lt!17612)) (size!282 (buf!627 (_2!729 lt!17612)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!530 array!655 (_ BitVec 64) (_ BitVec 64)) tuple2!1366)

(assert (=> b!11149 (= lt!17612 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!11150 () Bool)

(assert (=> b!11150 (= e!6815 (array_inv!274 (buf!627 thiss!1486)))))

(declare-fun b!11151 () Bool)

(declare-fun res!10981 () Bool)

(assert (=> b!11151 (=> (not res!10981) (not e!6813))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!11151 (= res!10981 (validate_offset_bits!1 ((_ sign_extend 32) (size!282 (buf!627 thiss!1486))) ((_ sign_extend 32) (currentByte!1699 thiss!1486)) ((_ sign_extend 32) (currentBit!1694 thiss!1486)) nBits!460))))

(declare-fun b!11152 () Bool)

(declare-fun res!10980 () Bool)

(assert (=> b!11152 (=> (not res!10980) (not e!6810))))

(assert (=> b!11152 (= res!10980 (= (size!282 (buf!627 thiss!1486)) (size!282 (buf!627 (_2!729 lt!17612)))))))

(declare-fun b!11153 () Bool)

(declare-fun res!10984 () Bool)

(assert (=> b!11153 (=> (not res!10984) (not e!6810))))

(declare-fun isPrefixOf!0 (BitStream!530 BitStream!530) Bool)

(assert (=> b!11153 (= res!10984 (isPrefixOf!0 thiss!1486 (_2!729 lt!17612)))))

(declare-fun b!11154 () Bool)

(declare-fun e!6814 () Bool)

(assert (=> b!11154 (= e!6814 true)))

(declare-datatypes ((tuple2!1368 0))(
  ( (tuple2!1369 (_1!730 array!655) (_2!730 BitStream!530)) )
))
(declare-fun lt!17611 () tuple2!1368)

(declare-fun lt!17607 () Unit!960)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!530 array!655 array!655 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!960)

(assert (=> b!11154 (= lt!17607 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!729 lt!17612) srcBuffer!6 (_1!730 lt!17611) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!11155 () Bool)

(assert (=> b!11155 (= e!6810 (not e!6814))))

(declare-fun res!10977 () Bool)

(assert (=> b!11155 (=> res!10977 e!6814)))

(declare-datatypes ((List!161 0))(
  ( (Nil!158) (Cons!157 (h!276 Bool) (t!911 List!161)) )
))
(declare-fun lt!17609 () List!161)

(declare-fun byteArrayBitContentToList!0 (BitStream!530 array!655 (_ BitVec 64) (_ BitVec 64)) List!161)

(assert (=> b!11155 (= res!10977 (not (= (byteArrayBitContentToList!0 (_2!729 lt!17612) (_1!730 lt!17611) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17609)))))

(declare-datatypes ((tuple2!1370 0))(
  ( (tuple2!1371 (_1!731 BitStream!530) (_2!731 BitStream!530)) )
))
(declare-fun lt!17608 () tuple2!1370)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!530 BitStream!530 (_ BitVec 64)) List!161)

(assert (=> b!11155 (= lt!17609 (bitStreamReadBitsIntoList!0 (_2!729 lt!17612) (_1!731 lt!17608) nBits!460))))

(declare-fun readBits!0 (BitStream!530 (_ BitVec 64)) tuple2!1368)

(assert (=> b!11155 (= lt!17611 (readBits!0 (_1!731 lt!17608) nBits!460))))

(assert (=> b!11155 (validate_offset_bits!1 ((_ sign_extend 32) (size!282 (buf!627 (_2!729 lt!17612)))) ((_ sign_extend 32) (currentByte!1699 thiss!1486)) ((_ sign_extend 32) (currentBit!1694 thiss!1486)) nBits!460)))

(declare-fun lt!17610 () Unit!960)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!530 array!655 (_ BitVec 64)) Unit!960)

(assert (=> b!11155 (= lt!17610 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!627 (_2!729 lt!17612)) nBits!460))))

(declare-fun reader!0 (BitStream!530 BitStream!530) tuple2!1370)

(assert (=> b!11155 (= lt!17608 (reader!0 thiss!1486 (_2!729 lt!17612)))))

(declare-fun b!11156 () Bool)

(declare-fun res!10978 () Bool)

(assert (=> b!11156 (=> res!10978 e!6814)))

(assert (=> b!11156 (= res!10978 (not (= lt!17609 (byteArrayBitContentToList!0 (_2!729 lt!17612) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!11157 () Bool)

(declare-fun res!10983 () Bool)

(assert (=> b!11157 (=> (not res!10983) (not e!6810))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!11157 (= res!10983 (= (bitIndex!0 (size!282 (buf!627 (_2!729 lt!17612))) (currentByte!1699 (_2!729 lt!17612)) (currentBit!1694 (_2!729 lt!17612))) (bvadd (bitIndex!0 (size!282 (buf!627 thiss!1486)) (currentByte!1699 thiss!1486) (currentBit!1694 thiss!1486)) nBits!460)))))

(assert (= (and start!2364 res!10982) b!11151))

(assert (= (and b!11151 res!10981) b!11149))

(assert (= (and b!11149 res!10979) b!11152))

(assert (= (and b!11152 res!10980) b!11157))

(assert (= (and b!11157 res!10983) b!11153))

(assert (= (and b!11153 res!10984) b!11155))

(assert (= (and b!11155 (not res!10977)) b!11156))

(assert (= (and b!11156 (not res!10978)) b!11154))

(assert (= start!2364 b!11150))

(declare-fun m!16297 () Bool)

(assert (=> b!11149 m!16297))

(declare-fun m!16299 () Bool)

(assert (=> b!11149 m!16299))

(declare-fun m!16301 () Bool)

(assert (=> b!11153 m!16301))

(declare-fun m!16303 () Bool)

(assert (=> b!11151 m!16303))

(declare-fun m!16305 () Bool)

(assert (=> b!11157 m!16305))

(declare-fun m!16307 () Bool)

(assert (=> b!11157 m!16307))

(declare-fun m!16309 () Bool)

(assert (=> b!11154 m!16309))

(declare-fun m!16311 () Bool)

(assert (=> start!2364 m!16311))

(declare-fun m!16313 () Bool)

(assert (=> start!2364 m!16313))

(declare-fun m!16315 () Bool)

(assert (=> b!11155 m!16315))

(declare-fun m!16317 () Bool)

(assert (=> b!11155 m!16317))

(declare-fun m!16319 () Bool)

(assert (=> b!11155 m!16319))

(declare-fun m!16321 () Bool)

(assert (=> b!11155 m!16321))

(declare-fun m!16323 () Bool)

(assert (=> b!11155 m!16323))

(declare-fun m!16325 () Bool)

(assert (=> b!11155 m!16325))

(declare-fun m!16327 () Bool)

(assert (=> b!11156 m!16327))

(declare-fun m!16329 () Bool)

(assert (=> b!11150 m!16329))

(push 1)

(assert (not b!11151))

(assert (not b!11150))

(assert (not b!11155))

(assert (not b!11153))

(assert (not b!11154))

(assert (not b!11156))

(assert (not b!11149))

(assert (not start!2364))

(assert (not b!11157))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)


; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17848 () Bool)

(assert start!17848)

(declare-fun b!87182 () Bool)

(declare-fun res!71688 () Bool)

(declare-fun e!57824 () Bool)

(assert (=> b!87182 (=> (not res!71688) (not e!57824))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!87182 (= res!71688 (bvslt i!576 nBits!336))))

(declare-fun b!87183 () Bool)

(declare-fun e!57828 () Bool)

(declare-datatypes ((array!4116 0))(
  ( (array!4117 (arr!2496 (Array (_ BitVec 32) (_ BitVec 8))) (size!1859 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3280 0))(
  ( (BitStream!3281 (buf!2249 array!4116) (currentByte!4464 (_ BitVec 32)) (currentBit!4459 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3280)

(declare-fun array_inv!1705 (array!4116) Bool)

(assert (=> b!87183 (= e!57828 (array_inv!1705 (buf!2249 thiss!1151)))))

(declare-fun b!87184 () Bool)

(declare-fun e!57831 () Bool)

(declare-datatypes ((tuple2!7372 0))(
  ( (tuple2!7373 (_1!3919 BitStream!3280) (_2!3919 Bool)) )
))
(declare-fun lt!135533 () tuple2!7372)

(declare-fun lt!135535 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87184 (= e!57831 (= (bitIndex!0 (size!1859 (buf!2249 (_1!3919 lt!135533))) (currentByte!4464 (_1!3919 lt!135533)) (currentBit!4459 (_1!3919 lt!135533))) lt!135535))))

(declare-fun res!71683 () Bool)

(declare-fun e!57823 () Bool)

(assert (=> start!17848 (=> (not res!71683) (not e!57823))))

(assert (=> start!17848 (= res!71683 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17848 e!57823))

(declare-fun thiss!1152 () BitStream!3280)

(declare-fun e!57825 () Bool)

(declare-fun inv!12 (BitStream!3280) Bool)

(assert (=> start!17848 (and (inv!12 thiss!1152) e!57825)))

(assert (=> start!17848 (and (inv!12 thiss!1151) e!57828)))

(assert (=> start!17848 true))

(declare-fun b!87185 () Bool)

(declare-fun res!71695 () Bool)

(assert (=> b!87185 (=> (not res!71695) (not e!57823))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87185 (= res!71695 (invariant!0 (currentBit!4459 thiss!1151) (currentByte!4464 thiss!1151) (size!1859 (buf!2249 thiss!1151))))))

(declare-fun b!87186 () Bool)

(declare-fun e!57827 () Bool)

(assert (=> b!87186 (= e!57827 e!57831)))

(declare-fun res!71689 () Bool)

(assert (=> b!87186 (=> (not res!71689) (not e!57831))))

(declare-fun lt!135534 () Bool)

(declare-datatypes ((Unit!5737 0))(
  ( (Unit!5738) )
))
(declare-datatypes ((tuple2!7374 0))(
  ( (tuple2!7375 (_1!3920 Unit!5737) (_2!3920 BitStream!3280)) )
))
(declare-fun lt!135532 () tuple2!7374)

(assert (=> b!87186 (= res!71689 (and (= (_2!3919 lt!135533) lt!135534) (= (_1!3919 lt!135533) (_2!3920 lt!135532))))))

(declare-fun readBitPure!0 (BitStream!3280) tuple2!7372)

(declare-fun readerFrom!0 (BitStream!3280 (_ BitVec 32) (_ BitVec 32)) BitStream!3280)

(assert (=> b!87186 (= lt!135533 (readBitPure!0 (readerFrom!0 (_2!3920 lt!135532) (currentBit!4459 thiss!1152) (currentByte!4464 thiss!1152))))))

(declare-fun b!87187 () Bool)

(declare-fun res!71684 () Bool)

(assert (=> b!87187 (=> (not res!71684) (not e!57827))))

(declare-fun isPrefixOf!0 (BitStream!3280 BitStream!3280) Bool)

(assert (=> b!87187 (= res!71684 (isPrefixOf!0 thiss!1152 (_2!3920 lt!135532)))))

(declare-fun b!87188 () Bool)

(declare-fun e!57826 () Bool)

(assert (=> b!87188 (= e!57826 e!57827)))

(declare-fun res!71685 () Bool)

(assert (=> b!87188 (=> (not res!71685) (not e!57827))))

(declare-fun lt!135537 () (_ BitVec 64))

(assert (=> b!87188 (= res!71685 (= lt!135535 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135537)))))

(assert (=> b!87188 (= lt!135535 (bitIndex!0 (size!1859 (buf!2249 (_2!3920 lt!135532))) (currentByte!4464 (_2!3920 lt!135532)) (currentBit!4459 (_2!3920 lt!135532))))))

(declare-fun b!87189 () Bool)

(assert (=> b!87189 (= e!57825 (array_inv!1705 (buf!2249 thiss!1152)))))

(declare-fun b!87190 () Bool)

(assert (=> b!87190 (= e!57824 (not true))))

(assert (=> b!87190 e!57826))

(declare-fun res!71690 () Bool)

(assert (=> b!87190 (=> (not res!71690) (not e!57826))))

(assert (=> b!87190 (= res!71690 (= (size!1859 (buf!2249 thiss!1152)) (size!1859 (buf!2249 (_2!3920 lt!135532)))))))

(declare-fun appendBit!0 (BitStream!3280 Bool) tuple2!7374)

(assert (=> b!87190 (= lt!135532 (appendBit!0 thiss!1152 lt!135534))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!87190 (= lt!135534 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87191 () Bool)

(declare-fun res!71693 () Bool)

(assert (=> b!87191 (=> (not res!71693) (not e!57823))))

(assert (=> b!87191 (= res!71693 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87192 () Bool)

(declare-fun res!71687 () Bool)

(assert (=> b!87192 (=> (not res!71687) (not e!57824))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87192 (= res!71687 (validate_offset_bits!1 ((_ sign_extend 32) (size!1859 (buf!2249 thiss!1152))) ((_ sign_extend 32) (currentByte!4464 thiss!1152)) ((_ sign_extend 32) (currentBit!4459 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!87193 () Bool)

(declare-fun res!71692 () Bool)

(assert (=> b!87193 (=> (not res!71692) (not e!57823))))

(assert (=> b!87193 (= res!71692 (invariant!0 (currentBit!4459 thiss!1152) (currentByte!4464 thiss!1152) (size!1859 (buf!2249 thiss!1152))))))

(declare-fun b!87194 () Bool)

(declare-fun res!71686 () Bool)

(assert (=> b!87194 (=> (not res!71686) (not e!57823))))

(assert (=> b!87194 (= res!71686 (and (bvsle i!576 nBits!336) (= (size!1859 (buf!2249 thiss!1152)) (size!1859 (buf!2249 thiss!1151)))))))

(declare-fun b!87195 () Bool)

(assert (=> b!87195 (= e!57823 e!57824)))

(declare-fun res!71691 () Bool)

(assert (=> b!87195 (=> (not res!71691) (not e!57824))))

(declare-fun lt!135536 () (_ BitVec 64))

(assert (=> b!87195 (= res!71691 (= lt!135537 (bvadd lt!135536 ((_ sign_extend 32) i!576))))))

(assert (=> b!87195 (= lt!135537 (bitIndex!0 (size!1859 (buf!2249 thiss!1152)) (currentByte!4464 thiss!1152) (currentBit!4459 thiss!1152)))))

(assert (=> b!87195 (= lt!135536 (bitIndex!0 (size!1859 (buf!2249 thiss!1151)) (currentByte!4464 thiss!1151) (currentBit!4459 thiss!1151)))))

(declare-fun b!87196 () Bool)

(declare-fun res!71694 () Bool)

(assert (=> b!87196 (=> (not res!71694) (not e!57823))))

(assert (=> b!87196 (= res!71694 (validate_offset_bits!1 ((_ sign_extend 32) (size!1859 (buf!2249 thiss!1151))) ((_ sign_extend 32) (currentByte!4464 thiss!1151)) ((_ sign_extend 32) (currentBit!4459 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(assert (= (and start!17848 res!71683) b!87196))

(assert (= (and b!87196 res!71694) b!87185))

(assert (= (and b!87185 res!71695) b!87191))

(assert (= (and b!87191 res!71693) b!87193))

(assert (= (and b!87193 res!71692) b!87194))

(assert (= (and b!87194 res!71686) b!87195))

(assert (= (and b!87195 res!71691) b!87192))

(assert (= (and b!87192 res!71687) b!87182))

(assert (= (and b!87182 res!71688) b!87190))

(assert (= (and b!87190 res!71690) b!87188))

(assert (= (and b!87188 res!71685) b!87187))

(assert (= (and b!87187 res!71684) b!87186))

(assert (= (and b!87186 res!71689) b!87184))

(assert (= start!17848 b!87189))

(assert (= start!17848 b!87183))

(declare-fun m!132743 () Bool)

(assert (=> b!87189 m!132743))

(declare-fun m!132745 () Bool)

(assert (=> b!87183 m!132745))

(declare-fun m!132747 () Bool)

(assert (=> b!87193 m!132747))

(declare-fun m!132749 () Bool)

(assert (=> start!17848 m!132749))

(declare-fun m!132751 () Bool)

(assert (=> start!17848 m!132751))

(declare-fun m!132753 () Bool)

(assert (=> b!87190 m!132753))

(declare-fun m!132755 () Bool)

(assert (=> b!87187 m!132755))

(declare-fun m!132757 () Bool)

(assert (=> b!87184 m!132757))

(declare-fun m!132759 () Bool)

(assert (=> b!87185 m!132759))

(declare-fun m!132761 () Bool)

(assert (=> b!87195 m!132761))

(declare-fun m!132763 () Bool)

(assert (=> b!87195 m!132763))

(declare-fun m!132765 () Bool)

(assert (=> b!87196 m!132765))

(declare-fun m!132767 () Bool)

(assert (=> b!87186 m!132767))

(assert (=> b!87186 m!132767))

(declare-fun m!132769 () Bool)

(assert (=> b!87186 m!132769))

(declare-fun m!132771 () Bool)

(assert (=> b!87188 m!132771))

(declare-fun m!132773 () Bool)

(assert (=> b!87192 m!132773))

(push 1)

(assert (not b!87193))

(assert (not b!87183))

(assert (not b!87184))

(assert (not b!87186))

(assert (not start!17848))

(assert (not b!87196))

(assert (not b!87188))

(assert (not b!87189))

(assert (not b!87185))


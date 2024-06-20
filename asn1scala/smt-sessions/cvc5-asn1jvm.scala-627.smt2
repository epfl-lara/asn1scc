; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17746 () Bool)

(assert start!17746)

(declare-fun b!85697 () Bool)

(declare-fun res!70347 () Bool)

(declare-fun e!57055 () Bool)

(assert (=> b!85697 (=> (not res!70347) (not e!57055))))

(declare-datatypes ((array!4071 0))(
  ( (array!4072 (arr!2475 (Array (_ BitVec 32) (_ BitVec 8))) (size!1838 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3238 0))(
  ( (BitStream!3239 (buf!2228 array!4071) (currentByte!4434 (_ BitVec 32)) (currentBit!4429 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3238)

(declare-datatypes ((Unit!5692 0))(
  ( (Unit!5693) )
))
(declare-datatypes ((tuple2!7282 0))(
  ( (tuple2!7283 (_1!3856 Unit!5692) (_2!3856 BitStream!3238)) )
))
(declare-fun lt!134860 () tuple2!7282)

(declare-fun isPrefixOf!0 (BitStream!3238 BitStream!3238) Bool)

(assert (=> b!85697 (= res!70347 (isPrefixOf!0 thiss!1152 (_2!3856 lt!134860)))))

(declare-fun b!85698 () Bool)

(declare-fun res!70346 () Bool)

(declare-fun e!57060 () Bool)

(assert (=> b!85698 (=> (not res!70346) (not e!57060))))

(declare-fun thiss!1151 () BitStream!3238)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85698 (= res!70346 (invariant!0 (currentBit!4429 thiss!1151) (currentByte!4434 thiss!1151) (size!1838 (buf!2228 thiss!1151))))))

(declare-fun b!85699 () Bool)

(declare-fun res!70345 () Bool)

(assert (=> b!85699 (=> (not res!70345) (not e!57060))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85699 (= res!70345 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85700 () Bool)

(declare-fun res!70352 () Bool)

(declare-fun e!57058 () Bool)

(assert (=> b!85700 (=> (not res!70352) (not e!57058))))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85700 (= res!70352 (validate_offset_bits!1 ((_ sign_extend 32) (size!1838 (buf!2228 thiss!1152))) ((_ sign_extend 32) (currentByte!4434 thiss!1152)) ((_ sign_extend 32) (currentBit!4429 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun res!70349 () Bool)

(assert (=> start!17746 (=> (not res!70349) (not e!57060))))

(assert (=> start!17746 (= res!70349 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17746 e!57060))

(declare-fun e!57057 () Bool)

(declare-fun inv!12 (BitStream!3238) Bool)

(assert (=> start!17746 (and (inv!12 thiss!1152) e!57057)))

(declare-fun e!57063 () Bool)

(assert (=> start!17746 (and (inv!12 thiss!1151) e!57063)))

(assert (=> start!17746 true))

(declare-fun b!85701 () Bool)

(declare-fun e!57061 () Bool)

(declare-datatypes ((tuple2!7284 0))(
  ( (tuple2!7285 (_1!3857 BitStream!3238) (_2!3857 Bool)) )
))
(declare-fun lt!134859 () tuple2!7284)

(declare-fun lt!134862 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85701 (= e!57061 (= (bitIndex!0 (size!1838 (buf!2228 (_1!3857 lt!134859))) (currentByte!4434 (_1!3857 lt!134859)) (currentBit!4429 (_1!3857 lt!134859))) lt!134862))))

(declare-fun b!85702 () Bool)

(assert (=> b!85702 (= e!57060 e!57058)))

(declare-fun res!70353 () Bool)

(assert (=> b!85702 (=> (not res!70353) (not e!57058))))

(declare-fun lt!134857 () (_ BitVec 64))

(declare-fun lt!134861 () (_ BitVec 64))

(assert (=> b!85702 (= res!70353 (= lt!134861 (bvadd lt!134857 ((_ sign_extend 32) i!576))))))

(assert (=> b!85702 (= lt!134861 (bitIndex!0 (size!1838 (buf!2228 thiss!1152)) (currentByte!4434 thiss!1152) (currentBit!4429 thiss!1152)))))

(assert (=> b!85702 (= lt!134857 (bitIndex!0 (size!1838 (buf!2228 thiss!1151)) (currentByte!4434 thiss!1151) (currentBit!4429 thiss!1151)))))

(declare-fun b!85703 () Bool)

(declare-fun array_inv!1684 (array!4071) Bool)

(assert (=> b!85703 (= e!57063 (array_inv!1684 (buf!2228 thiss!1151)))))

(declare-fun b!85704 () Bool)

(assert (=> b!85704 (= e!57057 (array_inv!1684 (buf!2228 thiss!1152)))))

(declare-fun b!85705 () Bool)

(declare-fun res!70354 () Bool)

(assert (=> b!85705 (=> (not res!70354) (not e!57060))))

(assert (=> b!85705 (= res!70354 (validate_offset_bits!1 ((_ sign_extend 32) (size!1838 (buf!2228 thiss!1151))) ((_ sign_extend 32) (currentByte!4434 thiss!1151)) ((_ sign_extend 32) (currentBit!4429 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85706 () Bool)

(assert (=> b!85706 (= e!57058 (not true))))

(declare-fun e!57059 () Bool)

(assert (=> b!85706 e!57059))

(declare-fun res!70344 () Bool)

(assert (=> b!85706 (=> (not res!70344) (not e!57059))))

(assert (=> b!85706 (= res!70344 (= (size!1838 (buf!2228 thiss!1152)) (size!1838 (buf!2228 (_2!3856 lt!134860)))))))

(declare-fun lt!134858 () Bool)

(declare-fun appendBit!0 (BitStream!3238 Bool) tuple2!7282)

(assert (=> b!85706 (= lt!134860 (appendBit!0 thiss!1152 lt!134858))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!85706 (= lt!134858 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!85707 () Bool)

(declare-fun res!70348 () Bool)

(assert (=> b!85707 (=> (not res!70348) (not e!57060))))

(assert (=> b!85707 (= res!70348 (invariant!0 (currentBit!4429 thiss!1152) (currentByte!4434 thiss!1152) (size!1838 (buf!2228 thiss!1152))))))

(declare-fun b!85708 () Bool)

(assert (=> b!85708 (= e!57059 e!57055)))

(declare-fun res!70350 () Bool)

(assert (=> b!85708 (=> (not res!70350) (not e!57055))))

(assert (=> b!85708 (= res!70350 (= lt!134862 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!134861)))))

(assert (=> b!85708 (= lt!134862 (bitIndex!0 (size!1838 (buf!2228 (_2!3856 lt!134860))) (currentByte!4434 (_2!3856 lt!134860)) (currentBit!4429 (_2!3856 lt!134860))))))

(declare-fun b!85709 () Bool)

(assert (=> b!85709 (= e!57055 e!57061)))

(declare-fun res!70351 () Bool)

(assert (=> b!85709 (=> (not res!70351) (not e!57061))))

(assert (=> b!85709 (= res!70351 (and (= (_2!3857 lt!134859) lt!134858) (= (_1!3857 lt!134859) (_2!3856 lt!134860))))))

(declare-fun readBitPure!0 (BitStream!3238) tuple2!7284)

(declare-fun readerFrom!0 (BitStream!3238 (_ BitVec 32) (_ BitVec 32)) BitStream!3238)

(assert (=> b!85709 (= lt!134859 (readBitPure!0 (readerFrom!0 (_2!3856 lt!134860) (currentBit!4429 thiss!1152) (currentByte!4434 thiss!1152))))))

(declare-fun b!85710 () Bool)

(declare-fun res!70343 () Bool)

(assert (=> b!85710 (=> (not res!70343) (not e!57060))))

(assert (=> b!85710 (= res!70343 (and (bvsle i!576 nBits!336) (= (size!1838 (buf!2228 thiss!1152)) (size!1838 (buf!2228 thiss!1151)))))))

(declare-fun b!85711 () Bool)

(declare-fun res!70342 () Bool)

(assert (=> b!85711 (=> (not res!70342) (not e!57058))))

(assert (=> b!85711 (= res!70342 (bvslt i!576 nBits!336))))

(assert (= (and start!17746 res!70349) b!85705))

(assert (= (and b!85705 res!70354) b!85698))

(assert (= (and b!85698 res!70346) b!85699))

(assert (= (and b!85699 res!70345) b!85707))

(assert (= (and b!85707 res!70348) b!85710))

(assert (= (and b!85710 res!70343) b!85702))

(assert (= (and b!85702 res!70353) b!85700))

(assert (= (and b!85700 res!70352) b!85711))

(assert (= (and b!85711 res!70342) b!85706))

(assert (= (and b!85706 res!70344) b!85708))

(assert (= (and b!85708 res!70350) b!85697))

(assert (= (and b!85697 res!70347) b!85709))

(assert (= (and b!85709 res!70351) b!85701))

(assert (= start!17746 b!85704))

(assert (= start!17746 b!85703))

(declare-fun m!131777 () Bool)

(assert (=> b!85705 m!131777))

(declare-fun m!131779 () Bool)

(assert (=> b!85704 m!131779))

(declare-fun m!131781 () Bool)

(assert (=> b!85697 m!131781))

(declare-fun m!131783 () Bool)

(assert (=> b!85698 m!131783))

(declare-fun m!131785 () Bool)

(assert (=> b!85706 m!131785))

(declare-fun m!131787 () Bool)

(assert (=> start!17746 m!131787))

(declare-fun m!131789 () Bool)

(assert (=> start!17746 m!131789))

(declare-fun m!131791 () Bool)

(assert (=> b!85702 m!131791))

(declare-fun m!131793 () Bool)

(assert (=> b!85702 m!131793))

(declare-fun m!131795 () Bool)

(assert (=> b!85703 m!131795))

(declare-fun m!131797 () Bool)

(assert (=> b!85700 m!131797))

(declare-fun m!131799 () Bool)

(assert (=> b!85709 m!131799))

(assert (=> b!85709 m!131799))

(declare-fun m!131801 () Bool)

(assert (=> b!85709 m!131801))

(declare-fun m!131803 () Bool)

(assert (=> b!85701 m!131803))

(declare-fun m!131805 () Bool)

(assert (=> b!85708 m!131805))

(declare-fun m!131807 () Bool)

(assert (=> b!85707 m!131807))

(push 1)

(assert (not b!85701))

(assert (not start!17746))

(assert (not b!85709))

(assert (not b!85706))

(assert (not b!85703))

(assert (not b!85704))

(assert (not b!85697))

(assert (not b!85698))

(assert (not b!85707))

(assert (not b!85705))

(assert (not b!85700))

(assert (not b!85702))

(assert (not b!85708))

(check-sat)


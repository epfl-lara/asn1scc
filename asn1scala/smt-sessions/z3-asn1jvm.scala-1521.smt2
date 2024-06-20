; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42544 () Bool)

(assert start!42544)

(declare-fun b!200721 () Bool)

(declare-fun e!137669 () Bool)

(declare-fun e!137671 () Bool)

(assert (=> b!200721 (= e!137669 e!137671)))

(declare-fun res!168052 () Bool)

(assert (=> b!200721 (=> (not res!168052) (not e!137671))))

(declare-fun lt!313723 () (_ BitVec 64))

(declare-fun lt!313722 () (_ BitVec 64))

(assert (=> b!200721 (= res!168052 (= lt!313723 lt!313722))))

(declare-fun lt!313725 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!200721 (= lt!313722 (bvsub lt!313725 ((_ sign_extend 32) i!590)))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!200721 (= lt!313725 (bvadd lt!313723 ((_ sign_extend 32) nBits!348)))))

(declare-datatypes ((array!10165 0))(
  ( (array!10166 (arr!5405 (Array (_ BitVec 32) (_ BitVec 8))) (size!4475 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8058 0))(
  ( (BitStream!8059 (buf!4976 array!10165) (currentByte!9365 (_ BitVec 32)) (currentBit!9360 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8058)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200721 (= lt!313723 (bitIndex!0 (size!4475 (buf!4976 thiss!1204)) (currentByte!9365 thiss!1204) (currentBit!9360 thiss!1204)))))

(declare-fun b!200722 () Bool)

(declare-fun res!168051 () Bool)

(assert (=> b!200722 (=> (not res!168051) (not e!137669))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200722 (= res!168051 (invariant!0 (currentBit!9360 thiss!1204) (currentByte!9365 thiss!1204) (size!4475 (buf!4976 thiss!1204))))))

(declare-fun b!200723 () Bool)

(declare-fun res!168054 () Bool)

(assert (=> b!200723 (=> (not res!168054) (not e!137669))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200723 (= res!168054 (validate_offset_bits!1 ((_ sign_extend 32) (size!4475 (buf!4976 thiss!1204))) ((_ sign_extend 32) (currentByte!9365 thiss!1204)) ((_ sign_extend 32) (currentBit!9360 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200724 () Bool)

(declare-fun e!137670 () Bool)

(declare-fun array_inv!4216 (array!10165) Bool)

(assert (=> b!200724 (= e!137670 (array_inv!4216 (buf!4976 thiss!1204)))))

(declare-fun lt!313726 () (_ BitVec 64))

(declare-fun b!200725 () Bool)

(assert (=> b!200725 (= e!137671 (not (or (= lt!313726 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!313726 (bvand lt!313722 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!200725 (= lt!313726 (bvand lt!313725 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isPrefixOf!0 (BitStream!8058 BitStream!8058) Bool)

(assert (=> b!200725 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14252 0))(
  ( (Unit!14253) )
))
(declare-fun lt!313724 () Unit!14252)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8058) Unit!14252)

(assert (=> b!200725 (= lt!313724 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun res!168050 () Bool)

(assert (=> start!42544 (=> (not res!168050) (not e!137669))))

(assert (=> start!42544 (= res!168050 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42544 e!137669))

(assert (=> start!42544 true))

(declare-fun inv!12 (BitStream!8058) Bool)

(assert (=> start!42544 (and (inv!12 thiss!1204) e!137670)))

(declare-fun b!200726 () Bool)

(declare-fun res!168053 () Bool)

(assert (=> b!200726 (=> (not res!168053) (not e!137669))))

(assert (=> b!200726 (= res!168053 (= i!590 nBits!348))))

(assert (= (and start!42544 res!168050) b!200723))

(assert (= (and b!200723 res!168054) b!200722))

(assert (= (and b!200722 res!168051) b!200726))

(assert (= (and b!200726 res!168053) b!200721))

(assert (= (and b!200721 res!168052) b!200725))

(assert (= start!42544 b!200724))

(declare-fun m!311433 () Bool)

(assert (=> b!200725 m!311433))

(declare-fun m!311435 () Bool)

(assert (=> b!200725 m!311435))

(declare-fun m!311437 () Bool)

(assert (=> b!200722 m!311437))

(declare-fun m!311439 () Bool)

(assert (=> b!200723 m!311439))

(declare-fun m!311441 () Bool)

(assert (=> start!42544 m!311441))

(declare-fun m!311443 () Bool)

(assert (=> b!200721 m!311443))

(declare-fun m!311445 () Bool)

(assert (=> b!200724 m!311445))

(check-sat (not b!200724) (not b!200722) (not start!42544) (not b!200725) (not b!200721) (not b!200723))
(check-sat)
(get-model)

(declare-fun d!68873 () Bool)

(assert (=> d!68873 (= (invariant!0 (currentBit!9360 thiss!1204) (currentByte!9365 thiss!1204) (size!4475 (buf!4976 thiss!1204))) (and (bvsge (currentBit!9360 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9360 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9365 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9365 thiss!1204) (size!4475 (buf!4976 thiss!1204))) (and (= (currentBit!9360 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9365 thiss!1204) (size!4475 (buf!4976 thiss!1204)))))))))

(assert (=> b!200722 d!68873))

(declare-fun d!68877 () Bool)

(declare-fun e!137693 () Bool)

(assert (=> d!68877 e!137693))

(declare-fun res!168083 () Bool)

(assert (=> d!68877 (=> (not res!168083) (not e!137693))))

(declare-fun lt!313758 () (_ BitVec 64))

(declare-fun lt!313762 () (_ BitVec 64))

(declare-fun lt!313759 () (_ BitVec 64))

(assert (=> d!68877 (= res!168083 (= lt!313762 (bvsub lt!313759 lt!313758)))))

(assert (=> d!68877 (or (= (bvand lt!313759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!313758 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!313759 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!313759 lt!313758) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!68877 (= lt!313758 (remainingBits!0 ((_ sign_extend 32) (size!4475 (buf!4976 thiss!1204))) ((_ sign_extend 32) (currentByte!9365 thiss!1204)) ((_ sign_extend 32) (currentBit!9360 thiss!1204))))))

(declare-fun lt!313760 () (_ BitVec 64))

(declare-fun lt!313757 () (_ BitVec 64))

(assert (=> d!68877 (= lt!313759 (bvmul lt!313760 lt!313757))))

(assert (=> d!68877 (or (= lt!313760 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!313757 (bvsdiv (bvmul lt!313760 lt!313757) lt!313760)))))

(assert (=> d!68877 (= lt!313757 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!68877 (= lt!313760 ((_ sign_extend 32) (size!4475 (buf!4976 thiss!1204))))))

(assert (=> d!68877 (= lt!313762 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9365 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9360 thiss!1204))))))

(assert (=> d!68877 (invariant!0 (currentBit!9360 thiss!1204) (currentByte!9365 thiss!1204) (size!4475 (buf!4976 thiss!1204)))))

(assert (=> d!68877 (= (bitIndex!0 (size!4475 (buf!4976 thiss!1204)) (currentByte!9365 thiss!1204) (currentBit!9360 thiss!1204)) lt!313762)))

(declare-fun b!200758 () Bool)

(declare-fun res!168084 () Bool)

(assert (=> b!200758 (=> (not res!168084) (not e!137693))))

(assert (=> b!200758 (= res!168084 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!313762))))

(declare-fun b!200759 () Bool)

(declare-fun lt!313761 () (_ BitVec 64))

(assert (=> b!200759 (= e!137693 (bvsle lt!313762 (bvmul lt!313761 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!200759 (or (= lt!313761 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!313761 #b0000000000000000000000000000000000000000000000000000000000001000) lt!313761)))))

(assert (=> b!200759 (= lt!313761 ((_ sign_extend 32) (size!4475 (buf!4976 thiss!1204))))))

(assert (= (and d!68877 res!168083) b!200758))

(assert (= (and b!200758 res!168084) b!200759))

(declare-fun m!311469 () Bool)

(assert (=> d!68877 m!311469))

(assert (=> d!68877 m!311437))

(assert (=> b!200721 d!68877))

(declare-fun d!68893 () Bool)

(assert (=> d!68893 (= (array_inv!4216 (buf!4976 thiss!1204)) (bvsge (size!4475 (buf!4976 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!200724 d!68893))

(declare-fun d!68895 () Bool)

(assert (=> d!68895 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9360 thiss!1204) (currentByte!9365 thiss!1204) (size!4475 (buf!4976 thiss!1204))))))

(declare-fun bs!16974 () Bool)

(assert (= bs!16974 d!68895))

(assert (=> bs!16974 m!311437))

(assert (=> start!42544 d!68895))

(declare-fun d!68897 () Bool)

(declare-fun res!168102 () Bool)

(declare-fun e!137704 () Bool)

(assert (=> d!68897 (=> (not res!168102) (not e!137704))))

(assert (=> d!68897 (= res!168102 (= (size!4475 (buf!4976 thiss!1204)) (size!4475 (buf!4976 thiss!1204))))))

(assert (=> d!68897 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!137704)))

(declare-fun b!200776 () Bool)

(declare-fun res!168101 () Bool)

(assert (=> b!200776 (=> (not res!168101) (not e!137704))))

(assert (=> b!200776 (= res!168101 (bvsle (bitIndex!0 (size!4475 (buf!4976 thiss!1204)) (currentByte!9365 thiss!1204) (currentBit!9360 thiss!1204)) (bitIndex!0 (size!4475 (buf!4976 thiss!1204)) (currentByte!9365 thiss!1204) (currentBit!9360 thiss!1204))))))

(declare-fun b!200777 () Bool)

(declare-fun e!137703 () Bool)

(assert (=> b!200777 (= e!137704 e!137703)))

(declare-fun res!168103 () Bool)

(assert (=> b!200777 (=> res!168103 e!137703)))

(assert (=> b!200777 (= res!168103 (= (size!4475 (buf!4976 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!200778 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10165 array!10165 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200778 (= e!137703 (arrayBitRangesEq!0 (buf!4976 thiss!1204) (buf!4976 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4475 (buf!4976 thiss!1204)) (currentByte!9365 thiss!1204) (currentBit!9360 thiss!1204))))))

(assert (= (and d!68897 res!168102) b!200776))

(assert (= (and b!200776 res!168101) b!200777))

(assert (= (and b!200777 (not res!168103)) b!200778))

(assert (=> b!200776 m!311443))

(assert (=> b!200776 m!311443))

(assert (=> b!200778 m!311443))

(assert (=> b!200778 m!311443))

(declare-fun m!311471 () Bool)

(assert (=> b!200778 m!311471))

(assert (=> b!200725 d!68897))

(declare-fun d!68903 () Bool)

(assert (=> d!68903 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!313801 () Unit!14252)

(declare-fun choose!11 (BitStream!8058) Unit!14252)

(assert (=> d!68903 (= lt!313801 (choose!11 thiss!1204))))

(assert (=> d!68903 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!313801)))

(declare-fun bs!16976 () Bool)

(assert (= bs!16976 d!68903))

(assert (=> bs!16976 m!311433))

(declare-fun m!311473 () Bool)

(assert (=> bs!16976 m!311473))

(assert (=> b!200725 d!68903))

(declare-fun d!68907 () Bool)

(assert (=> d!68907 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4475 (buf!4976 thiss!1204))) ((_ sign_extend 32) (currentByte!9365 thiss!1204)) ((_ sign_extend 32) (currentBit!9360 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4475 (buf!4976 thiss!1204))) ((_ sign_extend 32) (currentByte!9365 thiss!1204)) ((_ sign_extend 32) (currentBit!9360 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16977 () Bool)

(assert (= bs!16977 d!68907))

(assert (=> bs!16977 m!311469))

(assert (=> b!200723 d!68907))

(check-sat (not d!68907) (not d!68895) (not b!200776) (not d!68903) (not b!200778) (not d!68877))

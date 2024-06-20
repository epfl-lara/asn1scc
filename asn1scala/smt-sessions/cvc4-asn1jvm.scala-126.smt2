; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3150 () Bool)

(assert start!3150)

(declare-fun b!14298 () Bool)

(declare-fun e!8836 () Bool)

(declare-fun e!8833 () Bool)

(assert (=> b!14298 (= e!8836 e!8833)))

(declare-fun res!13562 () Bool)

(assert (=> b!14298 (=> (not res!13562) (not e!8833))))

(declare-fun lt!21949 () (_ BitVec 64))

(declare-fun lt!21944 () (_ BitVec 64))

(assert (=> b!14298 (= res!13562 (= lt!21949 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21944)))))

(declare-datatypes ((array!799 0))(
  ( (array!800 (arr!771 (Array (_ BitVec 32) (_ BitVec 8))) (size!342 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!644 0))(
  ( (BitStream!645 (buf!693 array!799) (currentByte!1831 (_ BitVec 32)) (currentBit!1826 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1149 0))(
  ( (Unit!1150) )
))
(declare-datatypes ((tuple2!1678 0))(
  ( (tuple2!1679 (_1!894 Unit!1149) (_2!894 BitStream!644)) )
))
(declare-fun lt!21948 () tuple2!1678)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14298 (= lt!21949 (bitIndex!0 (size!342 (buf!693 (_2!894 lt!21948))) (currentByte!1831 (_2!894 lt!21948)) (currentBit!1826 (_2!894 lt!21948))))))

(declare-fun thiss!957 () BitStream!644)

(assert (=> b!14298 (= lt!21944 (bitIndex!0 (size!342 (buf!693 thiss!957)) (currentByte!1831 thiss!957) (currentBit!1826 thiss!957)))))

(declare-fun b!14299 () Bool)

(declare-fun e!8832 () Bool)

(declare-fun e!8837 () Bool)

(assert (=> b!14299 (= e!8832 e!8837)))

(declare-fun res!13564 () Bool)

(assert (=> b!14299 (=> (not res!13564) (not e!8837))))

(declare-datatypes ((tuple2!1680 0))(
  ( (tuple2!1681 (_1!895 BitStream!644) (_2!895 Bool)) )
))
(declare-fun lt!21950 () tuple2!1680)

(assert (=> b!14299 (= res!13564 (and (not (_2!895 lt!21950)) (= (_1!895 lt!21950) (_2!894 lt!21948))))))

(declare-fun readBitPure!0 (BitStream!644) tuple2!1680)

(declare-fun readerFrom!0 (BitStream!644 (_ BitVec 32) (_ BitVec 32)) BitStream!644)

(assert (=> b!14299 (= lt!21950 (readBitPure!0 (readerFrom!0 (_2!894 lt!21948) (currentBit!1826 thiss!957) (currentByte!1831 thiss!957))))))

(declare-fun b!14300 () Bool)

(declare-fun res!13568 () Bool)

(assert (=> b!14300 (=> (not res!13568) (not e!8833))))

(declare-fun isPrefixOf!0 (BitStream!644 BitStream!644) Bool)

(assert (=> b!14300 (= res!13568 (isPrefixOf!0 thiss!957 (_2!894 lt!21948)))))

(declare-fun b!14302 () Bool)

(declare-fun e!8834 () Bool)

(assert (=> b!14302 (= e!8834 e!8832)))

(declare-fun res!13570 () Bool)

(assert (=> b!14302 (=> (not res!13570) (not e!8832))))

(declare-fun lt!21945 () (_ BitVec 64))

(declare-fun lt!21947 () (_ BitVec 64))

(assert (=> b!14302 (= res!13570 (= lt!21945 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21947)))))

(assert (=> b!14302 (= lt!21945 (bitIndex!0 (size!342 (buf!693 (_2!894 lt!21948))) (currentByte!1831 (_2!894 lt!21948)) (currentBit!1826 (_2!894 lt!21948))))))

(assert (=> b!14302 (= lt!21947 (bitIndex!0 (size!342 (buf!693 thiss!957)) (currentByte!1831 thiss!957) (currentBit!1826 thiss!957)))))

(declare-fun b!14303 () Bool)

(assert (=> b!14303 (= e!8837 (= (bitIndex!0 (size!342 (buf!693 (_1!895 lt!21950))) (currentByte!1831 (_1!895 lt!21950)) (currentBit!1826 (_1!895 lt!21950))) lt!21945))))

(declare-fun b!14304 () Bool)

(declare-fun e!8835 () Bool)

(assert (=> b!14304 (= e!8833 e!8835)))

(declare-fun res!13569 () Bool)

(assert (=> b!14304 (=> (not res!13569) (not e!8835))))

(declare-fun lt!21946 () tuple2!1680)

(assert (=> b!14304 (= res!13569 (and (not (_2!895 lt!21946)) (= (_1!895 lt!21946) (_2!894 lt!21948))))))

(assert (=> b!14304 (= lt!21946 (readBitPure!0 (readerFrom!0 (_2!894 lt!21948) (currentBit!1826 thiss!957) (currentByte!1831 thiss!957))))))

(declare-fun b!14305 () Bool)

(assert (=> b!14305 (= e!8835 (= (bitIndex!0 (size!342 (buf!693 (_1!895 lt!21946))) (currentByte!1831 (_1!895 lt!21946)) (currentBit!1826 (_1!895 lt!21946))) lt!21949))))

(declare-fun b!14306 () Bool)

(declare-fun e!8831 () Bool)

(assert (=> b!14306 (= e!8831 (not e!8836))))

(declare-fun res!13567 () Bool)

(assert (=> b!14306 (=> (not res!13567) (not e!8836))))

(assert (=> b!14306 (= res!13567 (= (size!342 (buf!693 (_2!894 lt!21948))) (size!342 (buf!693 thiss!957))))))

(assert (=> b!14306 e!8834))

(declare-fun res!13565 () Bool)

(assert (=> b!14306 (=> (not res!13565) (not e!8834))))

(assert (=> b!14306 (= res!13565 (= (size!342 (buf!693 thiss!957)) (size!342 (buf!693 (_2!894 lt!21948)))))))

(declare-fun appendBit!0 (BitStream!644 Bool) tuple2!1678)

(assert (=> b!14306 (= lt!21948 (appendBit!0 thiss!957 false))))

(declare-fun b!14307 () Bool)

(declare-fun e!8830 () Bool)

(declare-fun array_inv!331 (array!799) Bool)

(assert (=> b!14307 (= e!8830 (array_inv!331 (buf!693 thiss!957)))))

(declare-fun res!13566 () Bool)

(assert (=> start!3150 (=> (not res!13566) (not e!8831))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!3150 (= res!13566 (validate_offset_bit!0 ((_ sign_extend 32) (size!342 (buf!693 thiss!957))) ((_ sign_extend 32) (currentByte!1831 thiss!957)) ((_ sign_extend 32) (currentBit!1826 thiss!957))))))

(assert (=> start!3150 e!8831))

(declare-fun inv!12 (BitStream!644) Bool)

(assert (=> start!3150 (and (inv!12 thiss!957) e!8830)))

(declare-fun b!14301 () Bool)

(declare-fun res!13563 () Bool)

(assert (=> b!14301 (=> (not res!13563) (not e!8832))))

(assert (=> b!14301 (= res!13563 (isPrefixOf!0 thiss!957 (_2!894 lt!21948)))))

(assert (= (and start!3150 res!13566) b!14306))

(assert (= (and b!14306 res!13565) b!14302))

(assert (= (and b!14302 res!13570) b!14301))

(assert (= (and b!14301 res!13563) b!14299))

(assert (= (and b!14299 res!13564) b!14303))

(assert (= (and b!14306 res!13567) b!14298))

(assert (= (and b!14298 res!13562) b!14300))

(assert (= (and b!14300 res!13568) b!14304))

(assert (= (and b!14304 res!13569) b!14305))

(assert (= start!3150 b!14307))

(declare-fun m!20771 () Bool)

(assert (=> b!14301 m!20771))

(declare-fun m!20773 () Bool)

(assert (=> b!14304 m!20773))

(assert (=> b!14304 m!20773))

(declare-fun m!20775 () Bool)

(assert (=> b!14304 m!20775))

(declare-fun m!20777 () Bool)

(assert (=> b!14305 m!20777))

(declare-fun m!20779 () Bool)

(assert (=> b!14306 m!20779))

(declare-fun m!20781 () Bool)

(assert (=> b!14303 m!20781))

(declare-fun m!20783 () Bool)

(assert (=> b!14298 m!20783))

(declare-fun m!20785 () Bool)

(assert (=> b!14298 m!20785))

(declare-fun m!20787 () Bool)

(assert (=> start!3150 m!20787))

(declare-fun m!20789 () Bool)

(assert (=> start!3150 m!20789))

(assert (=> b!14299 m!20773))

(assert (=> b!14299 m!20773))

(assert (=> b!14299 m!20775))

(declare-fun m!20791 () Bool)

(assert (=> b!14307 m!20791))

(assert (=> b!14300 m!20771))

(assert (=> b!14302 m!20783))

(assert (=> b!14302 m!20785))

(push 1)

(assert (not b!14302))

(assert (not b!14307))

(assert (not start!3150))

(assert (not b!14301))

(assert (not b!14303))

(assert (not b!14304))

(assert (not b!14298))

(assert (not b!14300))

(assert (not b!14299))

(assert (not b!14305))

(assert (not b!14306))

(check-sat)

(pop 1)

(push 1)

(check-sat)


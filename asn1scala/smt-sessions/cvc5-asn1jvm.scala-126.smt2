; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3146 () Bool)

(assert start!3146)

(declare-fun b!14238 () Bool)

(declare-fun res!13515 () Bool)

(declare-fun e!8777 () Bool)

(assert (=> b!14238 (=> (not res!13515) (not e!8777))))

(declare-datatypes ((array!795 0))(
  ( (array!796 (arr!769 (Array (_ BitVec 32) (_ BitVec 8))) (size!340 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!640 0))(
  ( (BitStream!641 (buf!691 array!795) (currentByte!1829 (_ BitVec 32)) (currentBit!1824 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!640)

(declare-datatypes ((Unit!1145 0))(
  ( (Unit!1146) )
))
(declare-datatypes ((tuple2!1670 0))(
  ( (tuple2!1671 (_1!890 Unit!1145) (_2!890 BitStream!640)) )
))
(declare-fun lt!21906 () tuple2!1670)

(declare-fun isPrefixOf!0 (BitStream!640 BitStream!640) Bool)

(assert (=> b!14238 (= res!13515 (isPrefixOf!0 thiss!957 (_2!890 lt!21906)))))

(declare-fun b!14239 () Bool)

(declare-fun e!8783 () Bool)

(declare-fun e!8775 () Bool)

(assert (=> b!14239 (= e!8783 e!8775)))

(declare-fun res!13513 () Bool)

(assert (=> b!14239 (=> (not res!13513) (not e!8775))))

(declare-datatypes ((tuple2!1672 0))(
  ( (tuple2!1673 (_1!891 BitStream!640) (_2!891 Bool)) )
))
(declare-fun lt!21903 () tuple2!1672)

(assert (=> b!14239 (= res!13513 (and (not (_2!891 lt!21903)) (= (_1!891 lt!21903) (_2!890 lt!21906))))))

(declare-fun readBitPure!0 (BitStream!640) tuple2!1672)

(declare-fun readerFrom!0 (BitStream!640 (_ BitVec 32) (_ BitVec 32)) BitStream!640)

(assert (=> b!14239 (= lt!21903 (readBitPure!0 (readerFrom!0 (_2!890 lt!21906) (currentBit!1824 thiss!957) (currentByte!1829 thiss!957))))))

(declare-fun b!14240 () Bool)

(declare-fun e!8782 () Bool)

(assert (=> b!14240 (= e!8777 e!8782)))

(declare-fun res!13512 () Bool)

(assert (=> b!14240 (=> (not res!13512) (not e!8782))))

(declare-fun lt!21904 () tuple2!1672)

(assert (=> b!14240 (= res!13512 (and (not (_2!891 lt!21904)) (= (_1!891 lt!21904) (_2!890 lt!21906))))))

(assert (=> b!14240 (= lt!21904 (readBitPure!0 (readerFrom!0 (_2!890 lt!21906) (currentBit!1824 thiss!957) (currentByte!1829 thiss!957))))))

(declare-fun b!14241 () Bool)

(declare-fun lt!21907 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!14241 (= e!8782 (= (bitIndex!0 (size!340 (buf!691 (_1!891 lt!21904))) (currentByte!1829 (_1!891 lt!21904)) (currentBit!1824 (_1!891 lt!21904))) lt!21907))))

(declare-fun b!14243 () Bool)

(declare-fun res!13509 () Bool)

(assert (=> b!14243 (=> (not res!13509) (not e!8783))))

(assert (=> b!14243 (= res!13509 (isPrefixOf!0 thiss!957 (_2!890 lt!21906)))))

(declare-fun b!14244 () Bool)

(declare-fun lt!21902 () (_ BitVec 64))

(assert (=> b!14244 (= e!8775 (= (bitIndex!0 (size!340 (buf!691 (_1!891 lt!21903))) (currentByte!1829 (_1!891 lt!21903)) (currentBit!1824 (_1!891 lt!21903))) lt!21902))))

(declare-fun b!14245 () Bool)

(declare-fun e!8776 () Bool)

(assert (=> b!14245 (= e!8776 e!8783)))

(declare-fun res!13511 () Bool)

(assert (=> b!14245 (=> (not res!13511) (not e!8783))))

(declare-fun lt!21905 () (_ BitVec 64))

(assert (=> b!14245 (= res!13511 (= lt!21902 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21905)))))

(assert (=> b!14245 (= lt!21902 (bitIndex!0 (size!340 (buf!691 (_2!890 lt!21906))) (currentByte!1829 (_2!890 lt!21906)) (currentBit!1824 (_2!890 lt!21906))))))

(assert (=> b!14245 (= lt!21905 (bitIndex!0 (size!340 (buf!691 thiss!957)) (currentByte!1829 thiss!957) (currentBit!1824 thiss!957)))))

(declare-fun b!14246 () Bool)

(declare-fun e!8778 () Bool)

(assert (=> b!14246 (= e!8778 (not e!8776))))

(declare-fun res!13510 () Bool)

(assert (=> b!14246 (=> (not res!13510) (not e!8776))))

(assert (=> b!14246 (= res!13510 (= (size!340 (buf!691 (_2!890 lt!21906))) (size!340 (buf!691 thiss!957))))))

(declare-fun e!8780 () Bool)

(assert (=> b!14246 e!8780))

(declare-fun res!13516 () Bool)

(assert (=> b!14246 (=> (not res!13516) (not e!8780))))

(assert (=> b!14246 (= res!13516 (= (size!340 (buf!691 thiss!957)) (size!340 (buf!691 (_2!890 lt!21906)))))))

(declare-fun appendBit!0 (BitStream!640 Bool) tuple2!1670)

(assert (=> b!14246 (= lt!21906 (appendBit!0 thiss!957 false))))

(declare-fun b!14247 () Bool)

(assert (=> b!14247 (= e!8780 e!8777)))

(declare-fun res!13508 () Bool)

(assert (=> b!14247 (=> (not res!13508) (not e!8777))))

(declare-fun lt!21908 () (_ BitVec 64))

(assert (=> b!14247 (= res!13508 (= lt!21907 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21908)))))

(assert (=> b!14247 (= lt!21907 (bitIndex!0 (size!340 (buf!691 (_2!890 lt!21906))) (currentByte!1829 (_2!890 lt!21906)) (currentBit!1824 (_2!890 lt!21906))))))

(assert (=> b!14247 (= lt!21908 (bitIndex!0 (size!340 (buf!691 thiss!957)) (currentByte!1829 thiss!957) (currentBit!1824 thiss!957)))))

(declare-fun b!14242 () Bool)

(declare-fun e!8779 () Bool)

(declare-fun array_inv!329 (array!795) Bool)

(assert (=> b!14242 (= e!8779 (array_inv!329 (buf!691 thiss!957)))))

(declare-fun res!13514 () Bool)

(assert (=> start!3146 (=> (not res!13514) (not e!8778))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!3146 (= res!13514 (validate_offset_bit!0 ((_ sign_extend 32) (size!340 (buf!691 thiss!957))) ((_ sign_extend 32) (currentByte!1829 thiss!957)) ((_ sign_extend 32) (currentBit!1824 thiss!957))))))

(assert (=> start!3146 e!8778))

(declare-fun inv!12 (BitStream!640) Bool)

(assert (=> start!3146 (and (inv!12 thiss!957) e!8779)))

(assert (= (and start!3146 res!13514) b!14246))

(assert (= (and b!14246 res!13516) b!14247))

(assert (= (and b!14247 res!13508) b!14238))

(assert (= (and b!14238 res!13515) b!14240))

(assert (= (and b!14240 res!13512) b!14241))

(assert (= (and b!14246 res!13510) b!14245))

(assert (= (and b!14245 res!13511) b!14243))

(assert (= (and b!14243 res!13509) b!14239))

(assert (= (and b!14239 res!13513) b!14244))

(assert (= start!3146 b!14242))

(declare-fun m!20727 () Bool)

(assert (=> b!14244 m!20727))

(declare-fun m!20729 () Bool)

(assert (=> start!3146 m!20729))

(declare-fun m!20731 () Bool)

(assert (=> start!3146 m!20731))

(declare-fun m!20733 () Bool)

(assert (=> b!14242 m!20733))

(declare-fun m!20735 () Bool)

(assert (=> b!14246 m!20735))

(declare-fun m!20737 () Bool)

(assert (=> b!14239 m!20737))

(assert (=> b!14239 m!20737))

(declare-fun m!20739 () Bool)

(assert (=> b!14239 m!20739))

(declare-fun m!20741 () Bool)

(assert (=> b!14243 m!20741))

(assert (=> b!14240 m!20737))

(assert (=> b!14240 m!20737))

(assert (=> b!14240 m!20739))

(declare-fun m!20743 () Bool)

(assert (=> b!14245 m!20743))

(declare-fun m!20745 () Bool)

(assert (=> b!14245 m!20745))

(assert (=> b!14238 m!20741))

(assert (=> b!14247 m!20743))

(assert (=> b!14247 m!20745))

(declare-fun m!20747 () Bool)

(assert (=> b!14241 m!20747))

(push 1)

(assert (not b!14244))

(assert (not b!14241))

(assert (not b!14240))

(assert (not b!14243))

(assert (not b!14238))

(assert (not b!14246))

(assert (not b!14239))

(assert (not b!14245))

(assert (not b!14247))

(assert (not start!3146))

(assert (not b!14242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

